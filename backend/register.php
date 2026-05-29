<?php
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Check whether the data has been posted
    $firstName = isset($_POST['FirstName']) ? trim($_POST['FirstName']) : '';
    $lastName = isset($_POST['LastName']) ? trim($_POST['LastName']) : '';
    $email = isset($_POST['EmailAddress']) ? trim($_POST['EmailAddress']) : '';
    $password = isset($_POST['Password']) ? trim($_POST['Password']) : '';

    // Empty field check
    if (empty($firstName) || empty($lastName) || empty($email) || empty($password)) {
        echo json_encode(['status' => 'error', 'message' => 'Lütfen tüm alanları doldurun.']);
        exit;
    }

    // Password length check
    if (strlen($password) < 6) {
        echo json_encode(['status' => 'error', 'message' => 'Şifreniz en az 6 karakter uzunluğunda olmalıdır.']);
        exit;
    }
    
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    try {
        $sql = "INSERT INTO users (FirstName, LastName, EmailAddress, Password) VALUES (:firstname, :lastname, :email, :password)";
        $stmt = $pdo->prepare($sql);
        
        $stmt->execute([
            ':firstname' => $firstName,
            ':lastname' => $lastName,
            ':email' => $email,
            ':password' => $hashedPassword
        ]);

        echo json_encode(['status' => 'success', 'message' => 'Kayıt başarılı! Artık giriş yapabilirsiniz.']);
        
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Bu e-posta adresi zaten kullanımda olabilir.']);
    }
}
?>