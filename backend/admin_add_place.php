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

    // Added isset and empty checks
    $placeName = isset($_POST['PlaceName']) ? trim($_POST['PlaceName']) : '';
    $location = isset($_POST['Location']) ? trim($_POST['Location']) : '';

    if (empty($placeName) || empty($location)) {
        echo json_encode(['status' => 'error', 'message' => 'Mekan adı ve adres boş bırakılamaz.']);
        exit;
    }

    try {
        $sql = "INSERT INTO places (PlaceName, Location) VALUES (:placename, :location)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':placename' => $placeName, ':location' => $location]);

        echo json_encode(['status' => 'success', 'message' => 'Yeni restoran başarıyla eklendi.']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Hata: ' . $e->getMessage()]);
    }
}
?>