<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json; charset=utf-8');

if (isset($_SESSION['UserID'])) {
    echo json_encode([
        'logged_in' => true,
        'user' => [
            'FirstName' => $_SESSION['FirstName'],
            'LastName' => $_SESSION['LastName'],
            'IsAdmin' => $_SESSION['IsAdmin']
        ]
    ]);
} else {
    echo json_encode(['logged_in' => false]);
}
?>