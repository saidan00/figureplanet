<?php
  class Carts extends Controller {
    public function __construct() {
      $this->cartModel = $this->model("Cart");
      $this->productModel = $this->model("Product");
      $this->userModel = $this->model("User");
      $this->orderModel = $this->model("Order");
    }

    public function index() {
      if (isLoggedIn()) {
        // Get current user id
        $userId = $_SESSION["user_id"];

        $result = $this->getCartByUserId($userId);

        // Init data
        $data = array(
          "cart" => $result["cart"],
          "totalCart" => $result["totalCart"],
          "subTotal" => $result["subTotal"],
          "shipping" => $result["shipping"],
          "total" => $result["total"]
        );

        $this->view("carts/index", $data);
      } else {
        $this->view("carts/index");
      }
    }

    public function addToCart($productSku = "", $quantity = 1) {
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Init data
        $data = array(
          "status" => true
        );

        // Get current user id
        $userId = $_SESSION["user_id"];

        // Check if product is out of stock
        $productQuantity = $this->productModel->getProductQuantity($productSku);
        if ($productQuantity == 0) {
          $data["status"] = 'out_of_stock';
          echo json_encode($data);
          die();
        } elseif ($productQuantity - $quantity < 0) {
          $data["status"] = 'less_than_required';
          echo json_encode($data);
          die();
        }

        if ($this->productModel->getProductBySKU($productSku)) {
          // If product found
          $this->cartModel->addToCart($userId, $productSku, $quantity);
          $this->productModel->updateProductQuantity($productSku, $productQuantity - $quantity);
        } else {
          $data["status"] = false;
        }

        echo json_encode($data);
      } else {
        redirect("carts");
      }
    }

    public function updateTotalCart() {
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isLoggedIn()) {
          $userId = $_SESSION["user_id"];
          $totalCart = $this->cartModel->getTotalCartByUserId($userId);
          $_SESSION["total_cart"] = $totalCart;

          $data = array(
            "totalCart" => $totalCart
          );

          echo json_encode($data);
        } else {
          $_SESSION["total_cart"] = 0;
          $data = array(
            "totalCart" => 0
          );

          echo json_encode($data);
        }
      }
    }

    public function updateCart($productSku = "", $quantity = 1) {
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $userId = $_SESSION["user_id"];

        // Init data
        $data = array(
          "status" => true
        );

        if ($this->productModel->getProductBySKU($productSku)) {
          // If product found

          // Get product quantity
          $productQuantity = $this->productModel->getProductQuantity($productSku);

          // Get current quantity of product in cart
          $currentCartQuantity = $this->cartModel->getCartQuantity($userId, $productSku);

          // Reset product quantity
          $this->productModel->updateProductQuantity($productSku, $productQuantity + $currentCartQuantity);

          // Get product quantity after reset
          $productQuantity = $this->productModel->getProductQuantity($productSku);

          // Check if product is enough
          if ($productQuantity - $quantity < 0) {
            $data['status'] = 'less_than_required';
            echo json_encode($data);
            die();
          }

          // Update cart
          $this->cartModel->updateCart($userId, $productSku, $quantity);

          // Update product quantity
          $this->productModel->updateProductQuantity($productSku, $productQuantity - $quantity);
        } else {
          $data = array(
            "status" => false
          );
        }

        echo json_encode($data);
      }
    }

    // Remove from cart
    public function removeFromCart($productSku) {
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isLoggedIn()) {
          $userId = $_SESSION["user_id"];

          //Reset product quantity
          $quantity = $this->cartModel->getCartQuantity($userId, $productSku);
          $productQuantity = $this->productModel->getProductQuantity($productSku);
          $this->productModel->updateProductQuantity($productSku, $productQuantity + $quantity);

          $this->cartModel->removeFromCart($userId, $productSku);

          $data = // Init data
          $data = array(
            "status" => true
          );
        } else {
          $data = array(
            "status" => true
          );
        }

        echo json_encode($data);
      }
    }

    // Get cart and set subtotal, shipping, total
    private function getCartByUserId($userId) {
      // Get current cart
      $cart = $this->cartModel->getCartByUserId($userId);
      $totalCart = count($cart);
      $subTotal = 0;

      for ($i = 0; $i < $totalCart; $i++) {
        $subTotal += $cart[$i]->price * $cart[$i]->quantity;
      }

      $shipping = 0;
      if ($subTotal < 100) {
        $shipping = 10;
      }

      $total = $subTotal + $shipping;

      // Init data
      $data = array(
        "cart" => $cart,
        "totalCart" => $totalCart,
        "subTotal" => $subTotal,
        "shipping" => $shipping,
        "total" => $total
      );

      return $data;
    }

    // Get cart by current logged in user (for AJAX)
    public function getCartByCurrentUser() {
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isLoggedIn()) {
          $userId = $_SESSION["user_id"];

          $data = $this->getCartByUserId($userId);

          echo json_encode($data);
        }
      } else {
        redirect("carts");
      }
    }

    // Proceed to checkout
    public function checkout() {
      if (isLoggedIn()) {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
          // Process form

          // Sanitize POST data
          $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

          $userId = $_SESSION["user_id"];

          $user = array(
            "firstname" => trim($_POST["firstname"]),
            "lastname" => trim($_POST["lastname"]),
            "phone" => trim($_POST["phone"]),
            "address" => trim($_POST["address"]),
          );
          // convert to object because PDO use fetch object option
          $user = (object) $user;

          // cart
          $cart = $this->getCartByUserId($userId);

          // Init data
          $data = array(
            "user" => $user,
            "cart" => $cart,
            "payment" => trim($_POST["payment"]),
            "firstname_err" => "",
            "lastname_err" => "",
            "phone_err" => "",
            "address_err" => "",
            "payment_err" => ""
          );

          // Check if no error occured
          $validated = true;

          // pattern
          $namePattern = '/^[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/';
          $addressPattern = "/[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/";
          $phonePattern = "/^0[1-9][0-9]{8}$/";

          // Validate name
          if (empty($data["user"]->firstname)) {
            $data["firstname_err"] = "Please enter first name";
            $validated = false;
          } else {
            if (!preg_match($namePattern, $data["user"]->firstname)) {
              $data["firstname_err"] = "First name must not contain special characters or digits";
              $validated = false;
            }
          }
          if (empty($data["user"]->lastname)) {
            $data["lastname_err"] = "Please enter last name";
            $validated = false;
          } else {
            if (!preg_match($namePattern, $data["user"]->lastname)) {
              $data["lastname_err"] = "Last name must not contain special characters or digits";
              $validated = false;
            }
          }

          // Validate phone
          if (empty($data["user"]->phone)) {
            $data["phone_err"] = "Please enter your phone";
            $validated = false;
          } else {
            if (!preg_match($phonePattern, $data["user"]->phone)) {
              $data["phone_err"] = "Phone is not valid";
              $validated = false;
            }
          }

          // Validate address
          if (empty($data["user"]->address)) {
            $data["address_err"] = "Please enter your address";
            $validated = false;
          } else {
            if (!preg_match($addressPattern, $data["user"]->address)) {
              $data["address_err"] = "Address is not valid";
              $validated = false;
            }
          }

          // Make sure no error occured
          if ($validated) {
            // Validated

            // Generate order code
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $time = time();
            $orderCode = $userId . date("YmdHis", $time);

            // Init order information
            $order = array(
              "user_id" => $userId,
              "cart" => $cart,
              "order_code" => $orderCode,
              "firstname" => $data["user"]->firstname,
              "lastname" => $data["user"]->lastname,
              "phone" => $data["user"]->phone,
              "address" => $data["user"]->address,
              "payment" => $data["payment"]
            );

            $this->orderModel->addToOrder($order);

            $this->cartModel->resetCartByUserId($userId);

            $this->view("carts/checkout_success");
          } else {
            // Load view
            $this->view("carts/checkout", $data);
          }
        } else {
          $userId = $_SESSION["user_id"];
          $cart = $this->getCartByUserId($userId);
          $user = $this->userModel->getUserById($userId);

          $data = array(
            "user" => $user,
            "cart" => $cart,
            "firstname_err" => "",
            "lastname_err" => "",
            "phone_err" => "",
            "address_err" => "",
            "payment_err" => ""
          );

          $this->view("carts/checkout", $data);
        }
      } else {
        redirect("users/login");
      }
    }
  }
?>
