<?php
session_start();
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

// Admin check
if (!isset($_SESSION['IsAdmin']) || $_SESSION['IsAdmin'] != 1) {
    echo json_encode(['status' => 'error', 'message' => 'Yetkisiz erişim.']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $placeId = isset($_POST['PlaceID']) ? (int)$_POST['PlaceID'] : 0;
    $foodId = isset($_POST['FoodID']) ? (int)$_POST['FoodID'] : 0;
    $price = isset($_POST['Price']) ? (float)$_POST['Price'] : 0;

    if ($placeId === 0 || $foodId === 0 || $price <= 0) {
        echo json_encode(['status' => 'error', 'message' => 'Geçersiz veya eksik veri.']);
        exit;
    }

    try {
        // Add the new food item to the restaurant menu
        $sql = "INSERT INTO menu (PlaceID, FoodID, Price, StockStatus, Rating) VALUES (:placeid, :foodid, :price, 1, 0.0)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':placeid' => $placeId,
            ':foodid' => $foodId,
            ':price' => $price
        ]);

        echo json_encode(['status' => 'success', 'message' => 'Ürün menüye başarıyla eklendi.']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Ekleme işlemi başarısız: ' . $e->getMessage()]);
    }
}
?>