<?php
  class Users extends Controller {
    public function __construct() {
      $this->userModel = $this->model("User");
    }

    public function index() {
      redirect("users/login");
    }

    public function login() {
      // Check for logged in user
      if (isLoggedIn()) {
        redirect("users/profile");
      }

      // Check for post
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process form

        // Sanitize POST data
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

        // Init data
        $data = array(
          "email" => strtolower(trim($_POST["email"])),
          "password" => trim($_POST["password"]),
          "email_err" => "",
          "password_err" => ""
        );

        // Check if no error occured
        $validated = true;

        // Validate email
        if (empty($data["email"])) {
          $data["email_err"] = "Please enter email";
          $validated = false;
        }

        // Validate password
        if (empty($data["password"])) {
          $data["password_err"] = "Please enter password";
          $validated = false;
        }

        // Check user/email
        if ($this->userModel->findUserByEmail($data["email"])) {
          // User found
        } else {
          // User not found
          $data["email_err"] = "Email doesn't exist";
          $validated = false;
        }

        // Make sure no error occured
        if ($validated) {
          // Check if user is banned
          $bannedUser = $this->userModel->isBanned($data["email"]);
          if ($bannedUser) {
            $this->view("pages/banned");
            die();
          }

          // Validated
          // Check and set logged in user
          $loggedInUser = $this->userModel->login($data);
          if ($loggedInUser) {
            $this->createUserSession($loggedInUser);
          } else {
            $data["password_err"] = "Password incorrect";
            $this->view("users/login", $data);
          }
        } else {
          // Load view
          $this->view("users/login", $data);
        }
      } else {
        // Init data
        $data = array(
          "email" => "",
          "password" => "",
          "email_err" => "",
          "password_err" => ""
        );

        // Load view
        $this->view("users/login", $data);
      }
    }

    public function register() {
      // Check for logged in user
      if (isLoggedIn()) {
        redirect("users/profile");
      }

      // Check for post
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process form

        // Sanitize POST data
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

        // Init data
        $data = array(
          "firstname" => trim($_POST["firstname"]),
          "lastname" => trim($_POST["lastname"]),
          "email" => strtolower(trim($_POST["email"])),
          "password" => trim($_POST["password"]),
          "confirm_password" => trim($_POST["confirm_password"]),
          "gender" => trim($_POST["gender"]),
          "phone" => trim($_POST["phone"]),
          "address" => trim($_POST["address"]),
          "firstname_err" => "",
          "lastname_err" => "",
          "email_err" => "",
          "password_err" => "",
          "confirm_password_err" => "",
          "gender_err" => "",
          "phone_err" => "",
          "address_err" => ""
        );

        // Check if no error occured
        $validated = true;

        // pattern
        $emailPattern = '/^[a-z0-9]{6,64}@[a-z0-9]{1,2}[a-z0-9\.]{1,127}(\.[a-z]{2,4})$/i';
        $namePattern = '/^[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/';
        $addressPattern = "/[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/";
        $phonePattern = "/^0[1-9][0-9]{8}$/";

        // Validate email
        if (empty($data["email"])) {
          $data["email_err"] = "Please enter email";
          $validated = false;
        } elseif ($this->userModel->findUserByEmail($data["email"])) {
          $data["email_err"] = "Email is already taken";
          $validated = false;
        } else {
          if (!preg_match($emailPattern, $data["email"])) {
            $data["email_err"] = "Email is not valid.";
            $validated = false;
          }
        }

        // Validate name
        if (empty($data["firstname"])) {
          $data["firstname_err"] = "Please enter first name";
          $validated = false;
        } else {
          if (!preg_match($namePattern, $data["firstname"])) {
            $data["firstname_err"] = "First name must not contain special characters or digits";
            $validated = false;
          }
        }
        if (empty($data["lastname"])) {
          $data["lastname_err"] = "Please enter last name";
          $validated = false;
        } else {
          if (!preg_match($namePattern, $data["lastname"])) {
            $data["lastname_err"] = "Last name must not contain special characters or digits";
            $validated = false;
          }
        }

        // Validate password
        if (empty($data["password"])) {
          $data["password_err"] = "Please enter password";
          $validated = false;
        } elseif (strlen($data["password"]) < 6) {
          $data["password_err"] = "Password must at least 6 characters";
          $validated = false;
        }

        // Validate confirm_password
        if (empty($data["confirm_password"])) {
          $data["confirm_password_err"] = "Please confirm your password";
          $validated = false;
        } elseif ($data["password"] != $data["confirm_password"]) {
          $data["confirm_password_err"] = "Passwords are not matched";
          $validated = false;
        }

        // Validate phone
        if (empty($data["phone"])) {
          $data["phone_err"] = "Please enter your phone";
          $validated = false;
        } else {
          if (!preg_match($phonePattern, $data["phone"])) {
            $data["phone_err"] = "Phone is not valid";
            $validated = false;
          }
        }

        // Validate address
        if (empty($data["address"])) {
          $data["address_err"] = "Please enter your address";
          $validated = false;
        } else {
          if (!preg_match($addressPattern, $data["address"])) {
            $data["address_err"] = "Address is not valid";
            $validated = false;
          }
        }

        // Make sure no error occured
        if ($validated) {
          // Validated

          // Hash password
          $data["password"] = password_hash($data["password"], PASSWORD_DEFAULT);

          // Register user
          if ($this->userModel->register($data)) {
            flash("register_success", "You are now registered.");
            redirect("users/login");
          } else {
            die("Something went wrong");
          }
        } else {
          // Load view
          $this->view("users/register", $data);
        }
      } else {
        // Init data
        $data = array(
          "firstname" => "",
          "lastname" => "",
          "email" => "",
          "password" => "",
          "confirm_password" => "",
          "gender" => "male",
          "phone" => "",
          "address" => "",
          "firstname_err" => "",
          "lastname_err" => "",
          "email_err" => "",
          "password_err" => "",
          "confirm_password_err" => "",
          "gender_err" => "",
          "phone_err" => "",
          "address_err" => ""
        );

        // Load view
        $this->view("users/register", $data);
      }
    }

    // Create user session
    private function createUserSession($user) {
      $_SESSION["user_id"] = $user->user_id;
      $_SESSION["user_email"] = $user->email;
      $_SESSION["user_name"] = $user->firstname;
      $_SESSION["user_role"] = $user->role;
      redirect("products");
    }

    // Logout
    public function logout() {
      unset($_SESSION["user_id"]);
      unset($_SESSION["user_email"]);
      unset($_SESSION["user_name"]);
      unset($_SESSION["user_role"]);
      session_destroy();
      redirect("users/login");
    }

    // View and edit profile
    public function profile() {
      // Check for logged in user
      if (!isLoggedIn()) {
        redirect("users/login");
      } else {
        // Check for post
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
          // Process form

          // Sanitize POST data
          $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

          // Get current logged in user
          $userId = $_SESSION["user_id"];
          $user = $this->userModel->getUserById($userId);

          // Init data
          $data = array(
            "firstname" => trim($_POST["firstname"]),
            "lastname" => trim($_POST["lastname"]),
            "email" => $user->email,
            "gender" => trim($_POST["gender"]),
            "phone" => trim($_POST["phone"]),
            "address" => trim($_POST["address"]),
            "firstname_err" => "",
            "lastname_err" => "",
            "gender_err" => "",
            "phone_err" => "",
            "address_err" => ""
          );

          // Check if no error occured
          $validated = true;

          // pattern
          $namePattern = '/^[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/';
          $addressPattern = "/[^0-9\[\]`!@#$%^&*()_+\\{}|;\':\",.\/<>?]*$/";
          $phonePattern = "/^0[1-9][0-9]{8}$/";

          // Validate name
          if (empty($data["firstname"])) {
            $data["firstname_err"] = "Please enter first name";
            $validated = false;
          } else {
            if (!preg_match($namePattern, $data["firstname"])) {
              $data["firstname_err"] = "First name must not contain special characters or digits";
              $validated = false;
            }
          }
          if (empty($data["lastname"])) {
            $data["lastname_err"] = "Please enter last name";
            $validated = false;
          } else {
            if (!preg_match($namePattern, $data["lastname"])) {
              $data["lastname_err"] = "Last name must not contain special characters or digits";
              $validated = false;
            }
          }

          // Validate phone
          if (empty($data["phone"])) {
            $data["phone_err"] = "Please enter your phone";
            $validated = false;
          } else {
            if (!preg_match($phonePattern, $data["phone"])) {
              $data["phone_err"] = "Phone is not valid";
              $validated = false;
            }
          }

          // Validate address
          if (empty($data["address"])) {
            $data["address_err"] = "Please enter your address";
            $validated = false;
          } else {
            if (!preg_match($addressPattern, $data["address"])) {
              $data["address_err"] = "Address is not valid";
              $validated = false;
            }
          }

          // Make sure no error occured
          if ($validated) {
            // Validated
            $this->userModel->updateUser($userId, $data);

            flash("update_profile_success", "Your profile is updated.");
            redirect("users/profile");
          } else {
            // Load view
            $this->view("users/profile", $data);
          }
        } else {
          // Get current logged in user
          $userId = $_SESSION["user_id"];
          $user = $this->userModel->getUserById($userId);

          // Init data
          $data = array(
            "firstname" => $user->firstname,
            "lastname" => $user->lastname,
            "email" => $user->email,
            "gender" => $user->gender,
            "phone" => $user->phone,
            "address" => $user->address,
            "firstname_err" => "",
            "lastname_err" => "",
            "gender_err" => "",
            "phone_err" => "",
            "address_err" => ""
          );

          // Load view
          $this->view("users/profile", $data);
        }
      }
    }

    // Change password
    public function changepassword() {
      // Check for logged in user
      if (!isLoggedIn()) {
        redirect("users/login");
      } else {
        // Check for post
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
          // Process form

          // Sanitize POST data
          $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

          // Get current logged in user
          $userId = $_SESSION["user_id"];
          $user = $this->userModel->getUserById($userId);

          // Init data
          $data = array(
            "password" => trim($_POST["password"]),
            "new_password" => trim($_POST["new_password"]),
            "confirm_password" => trim($_POST["confirm_password"]),
            "password_err" => "",
            "new_password_err" => "",
            "confirm_password_err" => ""
          );

          // Check if no error occured
          $validated = true;

          // Validate password
          if (empty($data["password"])) {
            $data["password_err"] = "Please enter password";
            $validated = false;
          } else {
            $hashed_password = $user->password;
            if (!password_verify($data["password"], $hashed_password)) {
              $data["password_err"] = "Password is incorrect";
              $validated = false;
            }
          }

          // Validate new password
          if (empty($data["new_password"])) {
            $data["new_password_err"] = "Please enter new password";
            $validated = false;
          } elseif (strlen($data["new_password"]) < 6) {
            $data["new_password_err"] = "Password must at least 6 characters";
            $validated = false;
          }

          // Validate confirm_password
          if (empty($data["confirm_password"])) {
            $data["confirm_password_err"] = "Please confirm your password";
            $validated = false;
          } elseif ($data["new_password"] != $data["confirm_password"]) {
            $data["confirm_password_err"] = "Passwords are not matched";
            $validated = false;
          }

          // Make sure no error occured
          if ($validated) {
            // Validated

            // Hash password
            $data["new_password"] = password_hash($data["new_password"], PASSWORD_DEFAULT);

            // Change user's password
            $this->userModel->changePassword($userId, $data["new_password"]);
            flash("update_profile_success", "Your password is changed.");
            redirect("users/changepassword");
          } else {
            // Load view
            $this->view("users/changepassword", $data);
          }
        } else {
          // Get current logged in user
          $userId = $_SESSION["user_id"];
          $user = $this->userModel->getUserById($userId);

          // Init data
          $data = array(
            "password" => "",
            "new_password" => "",
            "confirm_password" => "",
            "password_err" => "",
            "new_password_err" => "",
            "confirm_password_err" => ""
          );

          // Load view
          $this->view("users/changepassword", $data);
        }
      }
    }

    // User's orders
    public function orders() {
      if (!isLoggedIn()) {
        redirect("users/login");
      } else {
        // Get current logged in user
        $userId = $_SESSION["user_id"];
        $user = $this->userModel->getUserById($userId);

        // Get user's orders
        $orders = $this->userModel->getUserOrders($userId);
        $totalOrder = count($orders);

        // Shipping
        $shipping = 20;

        // Init data
        $data = array(
          "orders" => $orders,
          "totalOrder" => $totalOrder,
          "shipping" => $shipping
        );
        $this->view("users/orders", $data);
      }
    }
  }
?>
