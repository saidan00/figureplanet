<?php
  class Order {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    // Add order
    public function addToOrder($order) {
      $this->db->query("INSERT INTO orders(user_id, order_code, firstname, lastname, phone, address, payment) VALUES(:user_id, :order_code, :firstname, :lastname, :phone, :address, :payment)");

      $this->db->bind(":user_id", $order["user_id"]);
      $this->db->bind(":order_code", $order["order_code"]);
      $this->db->bind(":firstname", $order["firstname"]);
      $this->db->bind(":lastname", $order["lastname"]);
      $this->db->bind(":phone", $order["phone"]);
      $this->db->bind(":address", $order["address"]);
      $this->db->bind(":payment", $order["payment"]);

      $this->db->execute();

      $this->addOrderDetail($order["order_code"], $order["cart"]);
    }

    // Add order details
    public function addOrderDetail($orderCode, $cart) {
      for ($i = 0; $i < $cart["totalCart"]; $i++) {
        $this->db->query("INSERT INTO order_details(order_code, product_sku, product_quantity, total_price) VALUES(:order_code, :product_sku, :product_quantity, :total_price)");

        $this->db->bind(":order_code", $orderCode);
        $this->db->bind(":product_sku", $cart["cart"][$i]->product_sku);
        $this->db->bind(":product_quantity", $cart["cart"][$i]->quantity);
        $this->db->bind(":total_price", $cart["cart"][$i]->quantity * $cart["cart"][$i]->price);

        $this->db->execute();
      }
    }

    // Find order by order code
    public function findOrderByCode($orderCode) {
      $this->db->query("SELECT id FROM orders WHERE order_code = :order_code");

      $this->db->bind(":order_code", $orderCode);

      $row = $this->db->single();

      if ($this->db->rowCount() > 0) {
        return true;
      } else {
        return false;
      }
    }

    // Get order by order code
    public function getOrderByCode($orderCode) {
      $this->db->query("SELECT * FROM orders WHERE order_code = :order_code");

      $this->db->bind(":order_code", $orderCode);

      $row = $this->db->single();
      return $row;
    }

    // Get order details
    public function getOrderDetails($orderCode) {
      $this->db->query("SELECT order_code, product_sku, imgPath, productName, price, product_quantity, total_price, categoryCode FROM order_details JOIN products ON order_details.product_sku = products.sku JOIN categories ON products.categoryID = categories.categoryID WHERE order_code = :order_code");

      $this->db->bind(":order_code", $orderCode);

      $result = $this->db->resultSet();
      return $result;
    }

    // Get order total
    public function getTotalOfOrder($orderCode) {
      $this->db->query("SELECT SUM(total_price) total FROM order_details WHERE order_code = :order_code GROUP BY order_code");

      $this->db->bind(":order_code", $orderCode);

      $row = $this->db->single();
      return $row->total;
    }

    // Get all orders
    public function adminGetAllOrders() {
      $this->db->query('SELECT orders.order_code, DATE_FORMAT(orders.created_at, "%d-%b-%Y %H:%i") created_at, status, SUM(total_price) total, email FROM orders JOIN order_details ON orders.order_code = order_details.order_code JOIN users ON orders.user_id = users.id GROUP BY order_details.order_code ORDER BY orders.created_at DESC');

      $result = $this->db->resultSet();
      return $result;
    }

    // Update order status
    public function updateOrderStatus($orderCode, $status) {
      $this->db->query('UPDATE orders SET status = :status WHERE order_code = :order_code');

      $this->db->bind(':order_code', $orderCode);
      $this->db->bind(':status', $status);

      $this->db->execute();
    }
  }
?>
