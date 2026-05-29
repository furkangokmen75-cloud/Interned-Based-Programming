<?php
session_start();
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['IsAdmin']) || $_SESSION['IsAdmin'] != 1) {
    echo json_encode(['status' => 'error', 'message' => 'Yetkisiz erişim.']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $placeId = isset($_POST['PlaceID']) ? (int)$_POST['PlaceID'] : 0;
    $placeName = isset($_POST['PlaceName']) ? trim($_POST['PlaceName']) : '';
    $location = isset($_POST['Location']) ? trim($_POST['Location']) : '';

    if ($placeId === 0 || empty($placeName) || empty($location)) {
        echo json_encode(['status' => 'error', 'message' => 'Eksik veya geçersiz veri gönderildi.']);
        exit;
    }

    try {
        $sql = "UPDATE places SET PlaceName = :placename, Location = :location WHERE PlaceID = :placeid";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':placename' => $placeName,
            ':location' => $location,
            ':placeid' => $placeId
        ]);

        echo json_encode(['status' => 'success', 'message' => 'Mekan bilgileri başarıyla güncellendi.']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Güncelleme başarısız: ' . $e->getMessage()]);
    }
}
?>