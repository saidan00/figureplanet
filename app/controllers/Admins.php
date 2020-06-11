<?php
class Admins extends Controller {
  public function __construct() {
    if (isUser() || !isLoggedIn()) {
      $this->view("pages/pagenotfound");
      die();
    }
    $this->productModel = $this->model("Product");
    $this->userModel = $this->model("User");
    $this->orderModel = $this->model("Order");
    $this->adminModel = $this->model("Admin");
  }

  public function index() {
    redirect("admins/products");
  }

  public function products() {
    $products = $this->productModel->adminGetAllProducts();
    $totalProducts = count($products);
    $data = array(
      "products" => $products,
      "totalProducts" => $totalProducts
    );
    $this->view("admins/products", $data);
  }

  public function addProduct() {
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      // Generate SKU
      $sku = $this->generateSku();

      // Get category by id
      $category = $this->productModel->getCategoryById($_POST["category"]);

      // Set root directory of public folder and set images directory
      $publicRoot = str_replace("app", "public", APPROOT);
      $imgDir = 'images/' . $category->categoryCode . '/' . $sku;

      // Get file properties
      $fileName = $_FILES['fileImg']['name'];
      $fileTempName = $_FILES['fileImg']['tmp_name'];
      $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

      // Set main image path
      $imgPath = $imgDir . '/' . $sku . '_01.' . $fileExtension;

      // Set where files to be stored
      $fileStore = $publicRoot . '/' . $imgPath;

      // Get categories
      $categories = $this->productModel->getAllCategories();
      $totalCategories = count($categories);

      // init data
      $data = array(
        "sku" => $sku,
        "productName" => trim($_POST["product-name"]),
        "categoryID" => trim($_POST["category"]),
        "available" => trim($_POST["available"]),
        "price" => trim($_POST["price"]),
        "description" => trim($_POST["description"]),
        "imgPath" => $imgPath,
        "categories" => $categories,
        "totalCategories" => $totalCategories,
        "name_err" => "",
        "price_err" => "",
        "description_err" => "",
        "file_err" => ""
      );

      // Check if no error occured
      $validated = true;

      // pattern
      $namePattern = '/^[^\[\]`!@#$%^&*()_+\\{}|;\'\",.\/<>?]*$/';

      // Validate product name
      if (empty($data["productName"])) {
        $data["name_err"] = "Please enter product name";
        $validated = false;
      } elseif (strlen($data["productName"]) < 3) {
        $data["name_err"] = "Product name must at least 3 characters";
        $validated = false;
      } else {
        if (!preg_match($namePattern, $data["productName"])) {
          $data["name_err"] = "Product name must not contain special characters";
          $validated = false;
        }
      }

      // Validate price
      if (empty($data["price"]) && $data["price"] != 0) {
        $data["price_err"] = "Please enter price";
        $validated = false;
      } elseif (!is_numeric($data["price"])) {
        $data["price_err"] = "Price must be number";
        $validated = false;
      } else {
        if ($data["price"] > 9999 || $data["price"] < 0) {
          $data["price_err"] = "Price must be between 0 and 9999";
          $validated = false;
        }
      }

      // Validate description
      if (empty($data["description"])) {
        $data["description_err"] = "Please enter description";
        $validated = false;
      } elseif (strlen($data["description"]) < 50) {
        $data["description_err"] = "Description must be at least 50 characters";
        $validated = false;
      }

      // Validate category
      if (!$this->productModel->getCategoryById($data["categoryID"])) {
        // no category found
        die("Something went wrong");
      }

      // Validate available
      if ($data["available"] != 0 && $data["available"] != 1) {
        die("Something went wrong");
      }

      // check file extension
      if ($fileExtension != "jpg" && $fileExtension != "jpeg" && $fileExtension != "png") {
        $data["file_err"] = "Only accept file in .jpg, .jpeg, .png extension";
        $validated = false;
      }

      if ($validated) {
        // create image folder
        mkdir($publicRoot . '/' . $imgDir);

        // move file to created folder
        move_uploaded_file($fileTempName, $fileStore);

        //Validated
        $this->productModel->addProduct($data);

        flash("add_success", "New product added");

        // clear data
        $data = array(
          "categories" => $categories,
          "totalCategories" => $totalCategories,
          "productName" => "",
          "price" => "",
          "description" => "",
          "name_err" => "",
          "price_err" => "",
          "description_err" => "",
          "file_err" => ""
        );

        $this->view("admins/addProduct", $data);
      } else {
        $this->view("admins/addProduct", $data);
      }
    } else {
      // Get categories
      $categories = $this->productModel->adminGetAllCategories();
      $totalCategories = count($categories);

      // init data
      $data = array(
        "categories" => $categories,
        "totalCategories" => $totalCategories,
        "productName" => "",
        "price" => "",
        "description" => "",
        "name_err" => "",
        "price_err" => "",
        "description_err" => "",
        "file_err" => ""
      );

      $this->view("admins/addProduct", $data);
    }

    // $this->productModel->addProduct($data);
  }

  // auto generate SKU
  private function generateSku() {
    // Output: 54ESMD
    $permitted_chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    while (true) {
      $sku = substr(str_shuffle($permitted_chars), 0, 6);
      if (!$this->productModel->adminGetProductBySKU($sku)) {
        //sku isn't taken
        return $sku;
      }
    }
  }

  // edit product
  public function editProduct($productSku = "") {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Process form

      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      //Get product
      $product = $this->productModel->adminGetProductBySKU($productSku);
      if (!$product) {
        //no product found
        die("Something went wrong");
      }

      // Set root directory of public folder and set images directory
      $publicRoot = str_replace("app", "public", APPROOT);

      // Get file properties
      $fileName = $_FILES['fileImg']['name'];
      $fileTempName = $_FILES['fileImg']['tmp_name'];
      $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

      // Set where files to be stored
      $fileStore = $publicRoot . '/' . $product->imgPath;

      // Get form values
      $product->productName = trim($_POST["product-name"]);
      $product->price = trim($_POST["price"]);
      $product->quantity = trim($_POST["quantity"]);
      $product->description = trim($_POST["description"]);
      $product->category_id = trim($_POST["category"]);
      $product->available = trim($_POST["available"]);

      // Get categories
      $categories = $this->productModel->getAllCategories();
      $totalCategories = count($categories);

      // init data
      $data = array(
        "product" => $product,
        "categories" => $categories,
        "totalCategories" => $totalCategories,
        "name_err" => "",
        "price_err" => "",
        "quantity_err" => "",
        "description_err" => "",
        "file_err" => ""
      );

      // Check if no error occured
      $validated = true;

      // pattern
      $namePattern = '/^[^\[\]`!@#$%^&*()_+\\{}|;\'\",.\/<>?]*$/';

      // Validate product name
      if (empty($data["product"]->productName)) {
        $data["name_err"] = "Please enter product name";
        $validated = false;
      } elseif (strlen($data["product"]->productName) < 3) {
        $data["name_err"] = "Product name must at least 3 characters";
        $validated = false;
      } else {
        if (!preg_match($namePattern, $data["product"]->productName)) {
          $data["name_err"] = "Product name must not contain special characters";
          $validated = false;
        }
      }

      // Validate price
      if (empty($data["product"]->price) && $data["product"]->price != 0) {
        $data["price_err"] = "Please enter price";
        $validated = false;
      } elseif (!is_numeric($data["product"]->price)) {
        $data["price_err"] = "Price must be number";
        $validated = false;
      } else {
        if ($data["product"]->price > 9999 || $data["product"]->price < 0) {
          $data["price_err"] = "Price must be between 0 and 9999";
          $validated = false;
        }
      }

      // Validate quantity
      if (empty($data["product"]->quantity) && $data["product"]->quantity != 0) {
        $data["quantity_err"] = "Please enter quantity";
        $validated = false;
      } elseif (!is_numeric($data["product"]->quantity)) {
        $data["quantity_err"] = "Quantity must be number";
        $validated = false;
      } else {
        if ($data["product"]->quantity < 0) {
          $data["quantity_err"] = "Quantity must be greater than 0";
          $validated = false;
        }
      }

      // Validate description
      if (empty($data["product"]->description)) {
        $data["description_err"] = "Please enter description";
        $validated = false;
      } elseif (strlen($data["product"]->description) < 50) {
        $data["description_err"] = "Description must be at least 50 characters";
        $validated = false;
      }

      // Validate category
      if (!$this->productModel->getCategoryById($data["product"]->category_id)) {
        // no category found
        die("Something went wrong");
      }

      // Validate available
      if ($data["product"]->available != 0 && $data["product"]->available != 1) {
        die("Something went wrong");
      }

      // check file extension
      if ($fileExtension != "jpg" && $fileExtension != "jpeg" && $fileExtension != "png") {
        $data["file_err"] = "Only accept file in .jpg, .jpeg, .png extension";
        $validated = false;
      }

      if ($validated) {
        // move file to created folder
        move_uploaded_file($fileTempName, $fileStore);

        //Validated
        $this->productModel->updateProduct($data["product"]);

        flash("update_success", "Product is updated");

        $this->view("admins/editProduct", $data);
      } else {
        $this->view("admins/editProduct", $data);
      }
    } else {
      //Get product
      $product = $this->productModel->adminGetProductBySKU($productSku);
      if (!$product) {
        //no product found
        $this->view("pages/pagenotfound");
        die();
      }

      // Get categories
      $categories = $this->productModel->getAllCategories();
      $totalCategories = count($categories);

      // init data
      $data = array(
        "product" => $product,
        "categories" => $categories,
        "totalCategories" => $totalCategories,
        "name_err" => "",
        "price_err" => "",
        "quantity_err" => "",
        "description_err" => "",
        "file_err" => ""
      );

      $this->view("admins/editProduct", $data);
    }
  }

  // Users page
  public function users() {
    $users = $this->userModel->adminGetAllUsers();
    $totalUsers = count($users);
    $data = array(
      "users" => $users,
      "totalUsers" => $totalUsers
    );
    $this->view("admins/users", $data);
  }

  // Edit user
  public function editUser($userId) {
    // Get user
    $user = $this->userModel->getUserById($userId);
    if (!$user) {
      // no user found
      $this->view("pages/pagenotfound");
      die();
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Process form

      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      // Get form values
      $roleId = trim($_POST["role"]);
      $isBanned = trim($_POST["is-banned"]);
      $isResetPasswd = trim($_POST["reset-password"]);

      // Set value for user
      $user->role_id = $roleId;
      $user->is_banned = $isBanned;

      // Update user
      $this->userModel->adminUpdateUser($user->user_id, $user->role_id, $user->is_banned = $isBanned);

      // Reset password to 123456
      if ($isResetPasswd) {
        $newPassword = password_hash("123456", PASSWORD_DEFAULT);
        $this->userModel->changePassword($user->user_id, $newPassword);
      }

      // Get all roles
      $roles = $this->userModel->adminGetAllRoles();
      $totalRoles = count($roles);

      $data = array(
        "user" => $user,
        "roles" => $roles,
        "totalRoles" => $totalRoles
      );

      flash("update_success", "User is updated");

      $this->view("admins/editUser", $data);
    } else {
      // Get all roles
      $roles = $this->userModel->adminGetAllRoles();
      $totalRoles = count($roles);

      $data = array(
        "user" => $user,
        "roles" => $roles,
        "totalRoles" => $totalRoles
      );

      $this->view("admins/editUser", $data);
    }
  }

  // Orders pages
  public function orders() {
    $orders = $this->orderModel->adminGetAllOrders();
    $totalOrders = count($orders);

    // Shipping
    $shipping = 20;

    $data = array(
      "orders" => $orders,
      "totalOrders" => $totalOrders,
      "shipping" => $shipping
    );
    $this->view("admins/orders", $data);
  }

  // Order details
  public function orderDetails($orderCode = '') {
    // check if order code exist
    $order = $this->orderModel->getOrderByCode($orderCode);
    if (!$order) {
      // no order found
      $this->view("pages/pagenotfound");
      die();
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Sanitize POST data
      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

      // Get order details
      $details = $this->orderModel->getOrderDetails($orderCode);
      $totalDetails = count($details);

      // Get total of order
      $subTotal = $this->orderModel->getTotalOfOrder($orderCode);
      $shipping = 20;
      $total = $subTotal + $shipping;

      $order->status = trim($_POST["status"]);
      $this->orderModel->updateOrderStatus($orderCode, $order->status);

      // Init data
      $data = array(
        "order" => $order,
        "details" => $details,
        "totalDetails" => $totalDetails,
        "subTotal" => $subTotal,
        "shipping" => $shipping,
        "total" => $total
      );

      $this->view("admins/orderDetails", $data);
    } else {
      // Get order details
      $details = $this->orderModel->getOrderDetails($orderCode);
      $totalDetails = count($details);

      // Get total of order
      $subTotal = $this->orderModel->getTotalOfOrder($orderCode);
      $shipping = 20;
      $total = $subTotal + $shipping;

      // Init data
      $data = array(
        "order" => $order,
        "details" => $details,
        "totalDetails" => $totalDetails,
        "subTotal" => $subTotal,
        "shipping" => $shipping,
        "total" => $total
      );

      $this->view("admins/orderDetails", $data);
    }
  }

  // Statistics
  public function statistics() {
    $this->view("admins/statistics");
  }

  // Statistics of products
  public function statistic_products($beginDate, $endDate) {
    if ($_SERVER["REQUEST_METHOD"] != "POST") {
      $this->view("pages/pagenotfound");
      die();
    } else {
      $this->orderModel->statistic_products($beginDate, $endDate);
      $data = array(
        "beginDate" => $beginDate,
        "endDate" => $endDate
      );
      echo json_encode($data);
    }
  }

  // Statistic - turnover by date
  public function statistic_turnover_by_date($beginDate = 0, $endDate = 0) {
    if ($_SERVER["REQUEST_METHOD"] != "POST") {
      $this->view("pages/pagenotfound");
      die();
    } else {
      $turnover = $this->adminModel->statistic_turnover_by_date($beginDate, $endDate);
      $data = array(
        "beginDate" => $beginDate,
        "endDate" => $endDate,
        "turnover" => $turnover
      );
      echo json_encode($data);
    }
  }
}
