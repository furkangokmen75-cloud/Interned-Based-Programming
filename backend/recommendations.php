<?php
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

try {
    // COUNT(r.ReviewID), LEFT JOIN, and GROUP BY were added
    $sql = "SELECT m.MenuID, f.FoodName, f.ImagePath, f.Description, c.CategoryName, c.CategoryID, p.PlaceID, p.PlaceName, m.Price, m.Rating, m.StockStatus, COUNT(r.ReviewID) as ReviewCount
            FROM menu m
            JOIN foods f ON m.FoodID = f.FoodID
            JOIN places p ON m.PlaceID = p.PlaceID
            JOIN categories c ON f.CategoryID = c.CategoryID
            LEFT JOIN reviews r ON m.MenuID = r.MenuID
            GROUP BY m.MenuID
            ORDER BY m.Rating DESC 
            LIMIT 6";
            
    $stmt = $pdo->query($sql);
    $results = $stmt->fetchAll();

    $formattedResults = array_map(function($row) {
        $priceLevel = $row['Price'] < 60 ? 1 : ($row['Price'] < 120 ? 2 : 3);
        
        $frontendCat = 'food';
        $emoji = '🔥';

        if (in_array($row['CategoryID'], [3, 4])) { 
            $frontendCat = 'dessert'; 
            $emoji = '🍩'; 
        }

        if ($row['CategoryID'] == 10) { 
            $frontendCat = 'drink'; 
            $emoji = '🥤'; 
        }

        return [
            'id' => (int)$row['MenuID'],
            'name' => $row['PlaceName'] . ' - ' . $row['FoodName'],
            'cat' => $frontendCat,
            'cuisine' => $row['CategoryName'],
            'rating' => (float)$row['Rating'],

            // Assign the real review count instead of a random number
            'reviews' => (int)$row['ReviewCount'], 

            'price' => $priceLevel,
            'priceLabel' => str_repeat('₺', $priceLevel),
            'dist' => round(rand(10, 50) / 10, 1), 
            'open' => (bool)$row['StockStatus'],
            'emoji' => $emoji,
            'tags' => ["Popüler", $row['CategoryName']],
            'desc' => $row['Description'],
            'hours' => ["Her gün", "09:00–23:00", "", ""], 
            'img' => $row['ImagePath']
        ];
    }, $results);

    echo json_encode(['status' => 'success', 'data' => $formattedResults]);

} catch (PDOException $e) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Öneriler yüklenemedi: ' . $e->getMessage()
    ]);
}
?>