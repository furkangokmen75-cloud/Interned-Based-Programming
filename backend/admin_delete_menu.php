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
    $menuId = isset($_POST['MenuID']) ? (int)$_POST['MenuID'] : 0;

    if ($menuId === 0) {
        echo json_encode(['status' => 'error', 'message' => 'Geçersiz Menü ID.']);
        exit;
    }

    try {
        $sql = "DELETE FROM menu WHERE MenuID = :menuid";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':menuid' => $menuId]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Ürün menüden başarıyla silindi.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Ürün bulunamadı.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Deletion failed: ' . $e->getMessage()]);
    }
}
?>