<?php
  class Product {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    // Get product
    public function getProductBySKU($sku) {
      $this->db->query('SELECT *, products.categoryID category_id FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE SKU = :sku AND available = true AND is_available = true');
      $this->db->bind(":sku", $sku);

      $row = $this->db->single();
      return $row;
    }

    // Admin get product
    public function adminGetProductBySKU($sku) {
      $this->db->query('SELECT *, products.categoryID category_id FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE SKU = :sku');
      $this->db->bind(":sku", $sku);

      $row = $this->db->single();
      return $row;
    }

    // Get Products By Category
    public function getProductsByCategory($categoryCode, $offset, $limit) {
      if ($categoryCode == "all") {
        $this->db->query('SELECT * FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE available = true AND is_available= true LIMIT :limit OFFSET :offset');

        $this->db->bind(":limit", $limit);
        $this->db->bind(":offset", $offset);
      } else {
        $this->db->query('SELECT * FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE categoryCode = :categoryCode AND available = true AND is_available= true LIMIT :limit OFFSET :offset');

        $this->db->bind(":categoryCode", $categoryCode);
        $this->db->bind(":limit", $limit);
        $this->db->bind(":offset", $offset);
      }

      $result = $this->db->resultSet();
      return $result;
    }

    // Get products by filter
    public function getProductsByFilter($filter) {
      $query =
      'SELECT * ' .
      'FROM products JOIN categories ON products.categoryID = categories.categoryID ';

      // filter by name
      if ($filter["name"] == "none") {
        $filter["name"] = "";
      }
      $query .= 'WHERE (productName LIKE :productName) ';

      if ($filter["priceFrom"] > $filter["priceTo"] || $filter["priceFrom"] < 0) {
        $filter["priceFrom"] = 0;
      }
      if ($filter["priceFrom"] > $filter["priceTo"] || $filter["priceTo"] > 9999) {
        $filter["priceTo"] = 9999;
      }
      $query .= 'AND (price BETWEEN :priceFrom AND :priceTo) ';

      // filter by category
      if ($filter["categoryCode"] != "all") {
        $query .= 'AND (categoryCode = :categoryCode) ';
      }

      // if product available
      $query .= 'AND available = true AND is_available= true ';

      // sort
      switch ($filter["sort"]) {
        case 'default':
          break;
        case 'a-to-z':
          $query .= 'ORDER BY productName ';
          break;
        case 'z-to-a':
          $query .= 'ORDER BY productName DESC ';
          break;
        case 'low-to-high':
          $query .= 'ORDER BY price ';
          break;
        case 'high-to-low':
          $query .= 'ORDER BY price DESC ';
          break;
        default:
          break;
      }

      // limit
      $query .= 'LIMIT :limit OFFSET :offset ';


      // remove space in the end of query
      $query = trim($query);

      $this->db->query($query);

      // bind values
      $this->db->bind(":productName", '%' . $filter["name"] . '%');
      $this->db->bind(":priceFrom", $filter["priceFrom"]);
      $this->db->bind(":priceTo", $filter["priceTo"]);
      $this->db->bind(":limit", $filter["limit"]);
      $this->db->bind(":offset", $filter["offset"]);
      if ($filter["categoryCode"] != "all") {
        $this->db->bind(":categoryCode", $filter["categoryCode"]);
      }

      $result = $this->db->resultSet();
      return $result;
    }

    // Get all categories
    public function getAllCategories() {
      $this->db->query('SELECT * FROM categories WHERE is_available = true');

      $result = $this->db->resultSet();
      return $result;
    }

    // Admin get all categories
    public function adminGetAllCategories() {
      $this->db->query('SELECT * FROM categories');

      $result = $this->db->resultSet();
      return $result;
    }

    // Get total of products by category
    public function getTotalProductsByCategory($categoryCode = "all") {
      if ($categoryCode == "all") {
        $this->db->query('SELECT SKU FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE available = true AND is_available= true');
      } else {
        $this->db->query('SELECT SKU FROM products JOIN categories ON products.categoryID = categories.categoryID WHERE categoryCode = :categoryCode AND available = true AND is_available= true');
        $this->db->bind(":categoryCode", $categoryCode);
      }

      $this->db->execute();
      $total = $this->db->rowCount();
      return $total;
    }

    // Get total of products by filter
    public function getTotalProductsByFilter($filter) {
      $query =
      'SELECT SKU ' .
      'FROM products JOIN categories ON products.categoryID = categories.categoryID ';

      // filter
      if ($filter["name"] == "none") {
        $filter["name"] = "";
      }
      $query .= 'WHERE (productName LIKE :productName) ';
      $query .= 'AND (price BETWEEN :priceFrom AND :priceTo) ';
      if ($filter["categoryCode"] != "all") {
        $query .= 'AND categoryCode = :categoryCode ';
      }

      $query .= 'AND available = true AND is_available= true ';

      $query = trim($query);

      $this->db->query($query);

      // bind values
      $this->db->bind(":productName", '%' . $filter["name"] . '%');
      $this->db->bind(":priceFrom", $filter["priceFrom"]);
      $this->db->bind(":priceTo", $filter["priceTo"]);
      if ($filter["categoryCode"] != "all") {
        $this->db->bind(":categoryCode", $filter["categoryCode"]);
      }

      $this->db->execute();
      $total = $this->db->rowCount();
      return $total;
    }

    // Add products (for admin)
    public function addProduct($product) {
      $this->db->query('INSERT INTO products(SKU, productName, price, categoryID, description, imgPath) VALUES(:sku, :productName, :price, :categoryID, :description, :imgPath)');

      $this->db->bind(":sku", $product["sku"]);
      $this->db->bind(":productName", $product["productName"]);
      $this->db->bind(":price", $product["price"]);
      $this->db->bind(":categoryID", $product["categoryID"]);
      $this->db->bind(":description", $product["description"]);
      $this->db->bind(":imgPath", $product["imgPath"]);

      $this->db->execute();
    }

    // Get category by category code
    public function getCategoryByCode($categoryCode) {
      $query = 'SELECT categoryID FROM categories ';
      if ($categoryCode != "all"){
        $query .= 'WHERE categoryCode = :categoryCode ';
        $query .= 'AND is_available = true';
      } else {
        $query .= 'WHERE is_available = true';
      }

      $this->db->query($query);

      if ($categoryCode != "all"){
        $this->db->bind(":categoryCode", $categoryCode);
      }

      $row = $this->db->single();
      return $row;
    }

    // Get category by category id
    public function getCategoryById($categoryId) {
      $query = 'SELECT categoryID FROM categories WHERE categoryID = :categoryID';

      $this->db->bind(":categoryID", $categoryId);

      $row = $this->db->single();
      return $row;
    }

    // Get all product (Admin)
    public function adminGetAllProducts() {
      $this->db->query("SELECT sku, productName, price, quantity, categoryName, categoryCode, imgPath, available FROM products JOIN categories ON products.categoryID = categories.categoryID");

      $result = $this->db->resultSet();
      return $result;
    }

    // Update product
    public function updateProduct($product) {
      $this->db->query("UPDATE products SET productName = :productName, price = :price, categoryID = :categoryID, description = :description, available = :available WHERE sku = :sku");

      $this->db->bind(":productName", $product->productName);
      $this->db->bind(":price", $product->price);
      $this->db->bind(":categoryID", $product->category_id);
      $this->db->bind(":description", $product->description);
      $this->db->bind(":available", $product->available);
      $this->db->bind(":sku", $product->sku);

      $this->db->execute();
    }

    // Get product quantity by sku
    public function getProductQuantity($productSku) {
      $this->db->query('SELECT quantity FROM products WHERE sku = :sku');

      $this->db->bind(':sku', $productSku);

      $row = $this->db->single();
      return $row->quantity;
    }

    // Update pproduct quantity
    public function updateProductQuantity($productSku, $quantity) {
      $this->db->query('UPDATE products SET quantity = :quantity WHERE sku = :sku');

      $this->db->bind(':sku', $productSku);
      $this->db->bind(':quantity', $quantity);

      $this->db->execute();
    }
  }
?>
