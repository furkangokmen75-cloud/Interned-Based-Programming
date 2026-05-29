<?php
require_once 'auth_check.php'; // Only logged-in users
require_once 'db_connect.php';

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // SECURITY PATCH: Check if MenuID exists and is not empty
    if (!isset($_POST['MenuID']) || empty($_POST['MenuID'])) {
        echo json_encode(['status' => 'error', 'message' => 'Geçersiz veya eksik MenuID.']);
        exit;
    }

    $menuId = (int)$_POST['MenuID'];
    $userId = $_SESSION['UserID'];

    try {
        $checkSql = "SELECT * FROM favoritemenu WHERE UserID = :userid AND MenuID = :menuid";
        $checkStmt = $pdo->prepare($checkSql);
        $checkStmt->execute([':userid' => $userId, ':menuid' => $menuId]);

        if ($checkStmt->rowCount() > 0) {
            $delSql = "DELETE FROM favoritemenu WHERE UserID = :userid AND MenuID = :menuid";
            $delStmt = $pdo->prepare($delSql);
            $delStmt->execute([':userid' => $userId, ':menuid' => $menuId]);
            
            echo json_encode(['status' => 'success', 'action' => 'removed', 'message' => 'Favorilerden çıkarıldı.']);
        } else {
            $insertSql = "INSERT INTO favoritemenu (MenuID, UserID) VALUES (:menuid, :userid)";
            $insertStmt = $pdo->prepare($insertSql);
            $insertStmt->execute([':menuid' => $menuId, ':userid' => $userId]);
            
            echo json_encode(['status' => 'success', 'action' => 'added', 'message' => 'Favorilere eklendi.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'İşlem başarısız: ' . $e->getMessage()]);
    }
}
?>