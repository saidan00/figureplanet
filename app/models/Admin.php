<?php
  class Admin {
    private $db;
    public function __construct() {
      $this->db = new Database();
    }

    public function statistic_turnover_by_date($beginDate, $endDate) {
      $this->db->query('SELECT order_code, order_date, SUM(product_quantity) quanity, SUM(total_price) turnover FROM turnover_by_date GROUP BY order_date');

      $result = $this->db->resultSet();
      return $result;
    }
  }
?>
