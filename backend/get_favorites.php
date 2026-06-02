<?php
require_once 'auth_check.php';
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

$userId = $_SESSION['UserID'];

try {
    $sql = "SELECT m.MenuID, f.FoodName, f.ImagePath, f.Description, c.CategoryName, c.CategoryID, p.PlaceID, p.PlaceName, m.Price, m.Rating, m.StockStatus, COUNT(r.ReviewID) as ReviewCount
            FROM favoritemenu fm
            JOIN menu m ON fm.MenuID = m.MenuID
            JOIN foods f ON m.FoodID = f.FoodID
            JOIN places p ON m.PlaceID = p.PlaceID
            JOIN categories c ON f.CategoryID = c.CategoryID
            LEFT JOIN reviews r ON m.MenuID = r.MenuID
            WHERE fm.UserID = :userid
            GROUP BY m.MenuID";
            
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':userid' => $userId]);
    $results = $stmt->fetchAll();

    $formattedResults = array_map(function($row) {
        $priceLevel = $row['Price'] < 60 ? 1 : ($row['Price'] < 120 ? 2 : 3);
        
        $frontendCat = 'food';
        $emoji = '🍽️';

        if (in_array($row['CategoryID'], [3, 4])) { 
            $frontendCat = 'dessert'; 
            $emoji = '🍰'; 
        }
        if ($row['CategoryID'] == 10) { 
            $frontendCat = 'drink'; 
            $emoji = '☕'; 
        }

        return [
            'id' => (int)$row['MenuID'],
            'name' => $row['PlaceName'] . ' - ' . $row['FoodName'],
            'cat' => $frontendCat,
            'cuisine' => $row['CategoryName'],
            'rating' => (float)$row['Rating'],
            'reviews' => (int)$row['ReviewCount'], 
            'price' => $priceLevel,
            'priceLabel' => str_repeat('₺', $priceLevel),
            'dist' => round(rand(10, 50) / 10, 1), 
            'open' => (bool)$row['StockStatus'],
            'emoji' => $emoji,
            'tags' => [$row['CategoryName'], "Favori"],
            'desc' => $row['Description'],
            'hours' => ["Her gün", "09:00–22:00", "", ""], 
            'img' => $row['ImagePath']
        ];
    }, $results);

    echo json_encode(['status' => 'success', 'data' => $formattedResults]);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Favoriler getirilemedi: ' . $e->getMessage()]);
}
?>