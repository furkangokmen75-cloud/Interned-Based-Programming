<?php
require_once 'auth_check.php';
require_once 'db_connect.php';

header('Content-Type: application/json; charset=utf-8');

// Stop execution immediately if MenuID is missing
if (!isset($_GET['MenuID']) || empty($_GET['MenuID'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'MenuID parametresi eksik.'
    ]);
    exit;
}

$menuId = (int)$_GET['MenuID'];

try {
    $sql = "SELECT r.Text, r.Rating, r.Date, u.FirstName, u.LastName 
            FROM reviews r 
            JOIN users u ON r.UserID = u.UserID 
            WHERE r.MenuID = :menuid 
            ORDER BY r.Date DESC";
            
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':menuid' => $menuId]);
    $reviews = $stmt->fetchAll();

    echo json_encode([
        'status' => 'success',
        'data' => $reviews
    ]);

} catch (PDOException $e) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Yorumlar getirilemedi: ' . $e->getMessage()
    ]);
}
?>