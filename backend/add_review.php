<?php
require_once 'auth_check.php';
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (!isset($_POST['MenuID']) || !isset($_POST['Text']) || !isset($_POST['Rating'])) {
        echo json_encode(['status' => 'error', 'message' => 'Eksik veri gönderildi.']);
        exit;
    }

    $menuId = (int)$_POST['MenuID'];
    $text = trim($_POST['Text']);
    $rating = (float)$_POST['Rating'];
    $userId = $_SESSION['UserID'];

    // 1. SECURITY CHECK: Is the rating between 1 and 5?
    if ($rating < 1 || $rating > 5) {
        echo json_encode(['status' => 'error', 'message' => 'Puan 1 ile 5 arasında olmalıdır.']);
        exit;
    }

    try {
        // 2. SPAM CHECK: Has the user already reviewed this product?
        $checkSql = "SELECT ReviewID FROM reviews WHERE MenuID = :menuid AND UserID = :userid";
        $checkStmt = $pdo->prepare($checkSql);
        $checkStmt->execute([':menuid' => $menuId, ':userid' => $userId]);
        
        if ($checkStmt->rowCount() > 0) {
            echo json_encode(['status' => 'error', 'message' => 'Bu ürüne zaten yorum yaptınız.']);
            exit;
        }

        $pdo->beginTransaction();

        // Insert the review
        $sql = "INSERT INTO reviews (MenuID, UserID, Text, Rating) VALUES (:menuid, :userid, :text, :rating)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':menuid' => $menuId, ':userid' => $userId, ':text' => $text, ':rating' => $rating]);

        // Increase the user's review count
        $pdo->prepare("UPDATE users SET ReviewCount = ReviewCount + 1 WHERE UserID = :userid")->execute([':userid' => $userId]);

        // Recalculate and update the food item's rating
        $avgSql = "SELECT AVG(Rating) as AvgRating FROM reviews WHERE MenuID = :menuid";
        $stmtAvg = $pdo->prepare($avgSql);
        $stmtAvg->execute([':menuid' => $menuId]);
        $newAvg = round($stmtAvg->fetch()['AvgRating'], 1);

        $pdo->prepare("UPDATE menu SET Rating = :newrating WHERE MenuID = :menuid")->execute([':newrating' => $newAvg, ':menuid' => $menuId]);

        // 3. PLACE RATING UPDATE: Update the overall restaurant rating as well
        $getPlace = $pdo->prepare("SELECT PlaceID FROM menu WHERE MenuID = :menuid");
        $getPlace->execute([':menuid' => $menuId]);
        $place = $getPlace->fetch();

        if ($place) {
            $placeId = $place['PlaceID'];

            // The restaurant rating is the average of all rated menu items
            $placeAvgSql = "SELECT AVG(Rating) as PlaceAvg FROM menu WHERE PlaceID = :placeid AND Rating > 0";
            $stmtPlaceAvg = $pdo->prepare($placeAvgSql);
            $stmtPlaceAvg->execute([':placeid' => $placeId]);
            $newPlaceAvg = round($stmtPlaceAvg->fetch()['PlaceAvg'], 1);

            $pdo->prepare("UPDATE places SET Rating = :newrating WHERE PlaceID = :placeid")->execute([':newrating' => $newPlaceAvg, ':placeid' => $placeId]);
        }

        $pdo->commit();
        echo json_encode(['status' => 'success', 'message' => 'Yorumunuz başarıyla kaydedildi.']);
    } catch (PDOException $e) {
        $pdo->rollBack();
        echo json_encode(['status' => 'error', 'message' => 'Hata oluştu: ' . $e->getMessage()]);
    }
}
?>