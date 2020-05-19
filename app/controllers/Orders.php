<?php
  class Orders extends Controller {
    public function __construct() {
      $this->orderModel = $this->model("Order");
    }

    public function index() {
      $this->view("pages/pagenotfound");
    }

    public function details($orderCode = "") {
      if (!isLoggedIn()) {
        redirect("users/login");
      } else {
        // Find order by code
        $order = $this->orderModel->getOrderByCode($orderCode);
        if (!$order || $order->user_id != $_SESSION['user_id']) {
          // no order found or order not belong to user
          $this->view("pages/pagenotfound");
          die();
        }

        // Get order details
        $details = $this->orderModel->getOrderDetails($orderCode);
        $totalDetails = count($details);

        // Get total of order
        $subTotal = $this->orderModel->getTotalOfOrder($orderCode);
        $shipping = 20;
        $total = $subTotal + $shipping;

        // Init data
        $data = array(
          "details" => $details,
          "totalDetails" => $totalDetails,
          "subTotal" => $subTotal,
          "shipping" => $shipping,
          "total" => $total
        );

        $this->view("orders/details", $data);
      }
    }
  }
?>
