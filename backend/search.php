<?php
require_once 'db_connect.php';
header('Content-Type: application/json; charset=utf-8');

$query = isset($_GET['q']) ? trim($_GET['q']) : '';
$cat = isset($_GET['cat']) ? trim($_GET['cat']) : 'all';

try {
    // COUNT(r.ReviewID) and LEFT JOIN reviews were added
    $sql = "SELECT m.MenuID, f.FoodName, f.ImagePath, f.Description, c.CategoryName, c.CategoryID, p.PlaceID, p.PlaceName, m.Price, m.Rating, m.StockStatus, COUNT(r.ReviewID) as ReviewCount
            FROM menu m
            JOIN foods f ON m.FoodID = f.FoodID
            JOIN places p ON m.PlaceID = p.PlaceID
            JOIN categories c ON f.CategoryID = c.CategoryID
            LEFT JOIN reviews r ON m.MenuID = r.MenuID
            WHERE 1=1";
            
    $params = [];

    if (!empty($query)) {
        $sql .= " AND (f.FoodName LIKE :query1 OR p.PlaceName LIKE :query2)";
        $params[':query1'] = "%$query%";
        $params[':query2'] = "%$query%";
    }

    if ($cat === 'food') {
        $sql .= " AND c.CategoryID IN (1, 2, 5, 6, 7, 8, 9)";
    } elseif ($cat === 'dessert') {
        $sql .= " AND c.CategoryID IN (3, 4)";
    } elseif ($cat === 'drink') {
        $sql .= " AND c.CategoryID = 10";
    }

    // Add grouping after the search filters
    $sql .= " GROUP BY m.MenuID";

    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $results = $stmt->fetchAll();

    $formattedResults = array_map(function($row) {
        $priceLevel = $row['Price'] < 60 ? 1 : ($row['Price'] < 120 ? 2 : 3);
        $priceLabel = str_repeat('₺', $priceLevel);
        
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

            // Assign the real review count from SQL instead of a random number
            'reviews' => (int)$row['ReviewCount'], 

            'price' => $priceLevel,
            'priceLabel' => $priceLabel,
            'dist' => round(rand(10, 50) / 10, 1), 
            'open' => (bool)$row['StockStatus'],
            'emoji' => $emoji,
            'tags' => [$row['CategoryName'], "Restoran"],
            'desc' => $row['Description'],
            'hours' => ["Her gün", "09:00–22:00", "", ""], 
            'img' => $row['ImagePath'] 
        ];
    }, $results);

    echo json_encode(['status' => 'success', 'data' => $formattedResults]);

} catch (PDOException $e) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Arama sırasında hata: ' . $e->getMessage()
    ]);
}
?>