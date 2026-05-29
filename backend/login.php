<?php
session_start(); 
require_once 'db_connect.php';

// Specify that the response will be returned in JSON format
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['EmailAddress']);
    $password = $_POST['Password'];

    try {
        $sql = "SELECT * FROM users WHERE EmailAddress = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':email' => $email]);
        
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['Password'])) {

            // Session variables
            $_SESSION['UserID'] = $user['UserID'];
            $_SESSION['FirstName'] = $user['FirstName'];
            $_SESSION['LastName'] = $user['LastName'];
            $_SESSION['IsAdmin'] = $user['IsAdmin'];

            // Return a successful JSON response to the frontend
            echo json_encode([
                'status' => 'success',
                'message' => 'Giriş başarılı!',
                'user' => [
                    'FirstName' => $user['FirstName'],
                    'LastName' => $user['LastName'],
                    'IsAdmin' => $user['IsAdmin']
                ]
            ]);
            
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Hatalı e-posta veya şifre!'
            ]);
        }
        
    } catch (PDOException $e) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Sistem hatası: ' . $e->getMessage()
        ]);
    }
}
?>