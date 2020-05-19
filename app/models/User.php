<?php
  class User {
    private $db;

    public function __construct() {
      $this->db = new Database();
    }

    // Find user by email
    public function findUserByEmail($email) {
      $this->db->query("SELECT email FROM users WHERE email = :email");

      // Bind value
      $this->db->bind(":email", $email);

      $row = $this->db->single();

      // Check row
      if ($this->db->rowCount() > 0) {
        return true;
      } else {
        return false;
      }
    }

    // Register user
    public function register($data) {
      // default account role
      $role = $this->getRoleId("user");
      $roleId = $role->id;

      $this->db->query("INSERT INTO users(firstname, lastname, email, password, gender, phone, address, role_id) VALUES(:firstname, :lastname, :email, :password, :gender, :phone, :address, :role_id)");

      // Bind values
      $this->db->bind(":firstname", $data["firstname"]);
      $this->db->bind(":lastname", $data["lastname"]);
      $this->db->bind(":email", $data["email"]);
      $this->db->bind(":password", $data["password"]);
      $this->db->bind(":gender", $data["gender"]);
      $this->db->bind(":phone", $data["phone"]);
      $this->db->bind(":address", $data["address"]);
      $this->db->bind("role_id", $roleId);

      // Execute
      if($this->db->execute()) {
        return true;
      } else {
        return false;
      }
    }

    // Login
    public function login($data) {
      $this->db->query("SELECT *, users.id user_id FROM users JOIN roles ON users.role_id = roles.id WHERE email = :email");
      $this->db->bind(":email", $data["email"]);

      $row = $this->db->single();
      $hashed_password = $row->password;
      if (password_verify($data["password"], $hashed_password)) {
        return $row;
      } else {
        return false;
      }
    }

    // Update
    public function updateUser($userId, $data) {
      $this->db->query("UPDATE users SET firstname = :firstname, lastname = :lastname, gender = :gender, phone = :phone, address = :address WHERE (id = :id)");

      $this->db->bind(":id", $userId);
      $this->db->bind(":firstname", $data["firstname"]);
      $this->db->bind(":lastname", $data["lastname"]);
      $this->db->bind(":gender", $data["gender"]);
      $this->db->bind(":phone", $data["phone"]);
      $this->db->bind(":address", $data["address"]);

      $this->db->execute();
    }

    // Admin update user
    public function adminUpdateUser($userId, $roleId, $isBanned) {
      $this->db->query("UPDATE users SET role_id = :role_id, is_banned = :is_banned WHERE (id = :id)");

      $this->db->bind(":id", $userId);
      $this->db->bind(":role_id", $roleId);
      $this->db->bind(":is_banned", $isBanned);

      $this->db->execute();
    }

    // Get user by id
    public function getUserById($id) {
      $this->db->query("SELECT *, users.id user_id, roles.id role_id FROM users JOIN roles ON users.role_id = roles.id WHERE users.id = :id");

      // Bind value
      $this->db->bind(":id", $id);

      $row = $this->db->single();
      return $row;
    }

    // Get role id
    public function getRoleId($role) {
      $this->db->query("SELECT id FROM roles WHERE role = :role");

      $this->db->bind(":role", $role);

      $row = $this->db->single();
      return $row;
    }

    // Change password
    public function changePassword($userId, $newPassword) {
      $this->db->query("UPDATE users SET password = :new_password WHERE (id = :id)");

      $this->db->bind(":id", $userId);
      $this->db->bind(":new_password", $newPassword);

      $this->db->execute();
    }

    // Get user's orders by id
    public function getUserOrders($userId) {
      $this->db->query('SELECT orders.order_code, DATE_FORMAT(orders.created_at, "%d-%b-%Y %H:%i") created_at, status, SUM(total_price) AS total FROM users JOIN orders ON users.id = orders.user_id JOIN order_details ON orders.order_code = order_details.order_code WHERE users.id = :user_id GROUP BY order_details.order_code ORDER BY orders.created_at DESC');

      $this->db->bind(":user_id", $userId);

      $resultSet = $this->db->resultSet();
      return $resultSet;
    }

    // Get all users
    public function adminGetAllUsers() {
      $this->db->query('SELECT *, users.id user_id, roles.id role_id FROM users JOIN roles ON users.role_id = roles.id');

      $result = $this->db->resultSet();
      return $result;
    }

    // Get all roles
    public function adminGetAllRoles() {
      $this->db->query('SELECT * FROM roles');

      $result = $this->db->resultSet();
      return $result;
    }

    // Check if user is banned
    public function isBanned($email) {
      $this->db->query('SELECT id FROM users WHERE email = :email AND is_banned = true');

      $this->db->bind("email", $email);

      $row = $this->db->single();
      
      if ($this->db->rowCount() > 0) {
        return true;
      } else {
        return false;
      }
    }
  }
?>
