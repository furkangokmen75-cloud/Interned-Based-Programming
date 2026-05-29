<?php
session_start();
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

// Admin check
if (!isset($_SESSION['IsAdmin']) || $_SESSION['IsAdmin'] != 1) {
    echo json_encode(['status' => 'error', 'message' => 'Yetkisiz erişim. Sadece yöneticiler bu işlemi yapabilir.']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $placeId = isset($_POST['PlaceID']) ? (int)$_POST['PlaceID'] : 0;

    if ($placeId === 0) {
        echo json_encode(['status' => 'error', 'message' => 'Geçersiz Mekan ID.']);
        exit;
    }

    try {
        // Thanks to ON DELETE CASCADE, menus, favorites, and reviews related to this place will be deleted automatically
        $sql = "DELETE FROM places WHERE PlaceID = :placeid";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':placeid' => $placeId]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(['status' => 'success', 'message' => 'Mekan ve bağlı tüm veriler sistemden başarıyla silindi.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Mekan bulunamadı veya zaten silinmiş.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Silme işlemi başarısız: ' . $e->getMessage()]);
    }
}
?>