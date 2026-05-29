<?php
session_start();
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['IsAdmin']) || $_SESSION['IsAdmin'] != 1) {
    echo json_encode(['status' => 'error', 'message' => 'Yetkisiz erişim.']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $menuId = isset($_POST['MenuID']) ? (int)$_POST['MenuID'] : 0;
    $price = isset($_POST['Price']) ? (float)$_POST['Price'] : -1;
    $stockStatus = isset($_POST['StockStatus']) ? (int)$_POST['StockStatus'] : -1; // 1: Exists, 0: Does not exist

    if ($menuId === 0 || $price < 0 || $stockStatus < 0) {
        echo json_encode(['status' => 'error', 'message' => 'Eksik veya hatalı veri.']);
        exit;
    }

    try {
        $sql = "UPDATE menu SET Price = :price, StockStatus = :stockstatus WHERE MenuID = :menuid";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':price' => $price,
            ':stockstatus' => $stockStatus,
            ':menuid' => $menuId
        ]);

        echo json_encode(['status' => 'success', 'message' => 'Ürün bilgileri başarıyla güncellendi.']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Güncelleme başarısız: ' . $e->getMessage()]);
    }
}
?>