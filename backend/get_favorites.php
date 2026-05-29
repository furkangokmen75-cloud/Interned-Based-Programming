<?php
require_once 'auth_check.php';
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

$userId = $_SESSION['UserID'];

try {
    $sql = "SELECT m.MenuID, f.FoodName, p.PlaceName, m.Price, m.Rating
            FROM favoritemenu fm
            JOIN menu m ON fm.MenuID = m.MenuID
            JOIN foods f ON m.FoodID = f.FoodID
            JOIN places p ON m.PlaceID = p.PlaceID
            WHERE fm.UserID = :userid";
            
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':userid' => $userId]);
    $favorites = $stmt->fetchAll();

    echo json_encode(['status' => 'success', 'data' => $favorites]);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Favoriler getirilemedi: ' . $e->getMessage()]);
}
?>