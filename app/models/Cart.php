<?php
  class Cart {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    // Add to cart
    public function addToCart($userId, $productSku, $quantity) {
      $this->db->query("INSERT INTO carts(user_id, product_sku, quantity) VALUES(:user_id, :product_sku, :quantity) ON DUPLICATE KEY UPDATE quantity = VALUES(quantity) + quantity");

      $this->db->bind(":user_id", $userId);
      $this->db->bind(":product_sku", $productSku);
      $this->db->bind(":quantity", $quantity);

      $this->db->execute();
    }

    // Get cart by user id
    public function getCartByUserId($userId) {
      $this->db->query("SELECT user_id, product_sku, carts.quantity quantity, sku, categoryID, productName, price, imgPath FROM carts JOIN products ON product_sku = sku WHERE user_id = :user_id ORDER BY carts.created_at DESC");

      $this->db->bind(":user_id", $userId);

      $result = $this->db->resultSet();
      return $result;
    }

    // Get total cart by user id
    public function getTotalCartByUserId($userId) {
      $this->db->query("SELECT id FROM carts WHERE user_id = :user_id");

      $this->db->bind(":user_id", $userId);

      $this->db->execute();

      $totalCarts = $this->db->rowCount();
      return $totalCarts;
    }

    // Update cart
    public function updateCart($userId, $productSku, $quantity) {
      $this->db->query("UPDATE carts SET quantity = :quantity WHERE (user_id = :user_id AND product_sku = :product_sku)");

      $this->db->bind(":user_id", $userId);
      $this->db->bind(":product_sku", $productSku);
      $this->db->bind(":quantity", $quantity);

      $this->db->execute();
    }

    // Remove from cart
    public function removeFromCart($userId, $productSku) {
      $this->db->query("DELETE FROM carts WHERE (user_id = :user_id AND product_sku = :product_sku)");

      $this->db->bind(":user_id", $userId);
      $this->db->bind(":product_sku", $productSku);

      $this->db->execute();
    }

    // Reset cart by user id
    public function resetCartByUserId($userId) {
      $this->db->query("DELETE FROM carts WHERE (user_id = :user_id)");

      $this->db->bind(":user_id", $userId);

      $this->db->execute();
    }

    // Get cart quantity by product sku and user id
    public function getCartQuantity($userId, $productSku) {
      $this->db->query('SELECT quantity FROM carts WHERE user_id = :user_id AND product_sku = :product_sku');

      $this->db->bind(":user_id", $userId);
      $this->db->bind(":product_sku", $productSku);

      $row = $this->db->single();
      return $row->quantity;
    }
  }
?>
