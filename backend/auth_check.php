<?php
// Start session if it has not already been started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// If the user is not logged in, return an error and stop execution
if (!isset($_SESSION['UserID'])) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 'error',
        'message' => 'Bu işlemi gerçekleştirmek için lütfen giriş yapın.'
    ]);
    exit;
}
?>