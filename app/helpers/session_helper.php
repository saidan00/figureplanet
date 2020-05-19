<?php
  session_name("FIGUREPLANET");
  session_start();

  // Flash message helper
  // Exp: flash("register_success", "You are now registered")
  // Display in view: echo flash("register_success");
  function flash($name = "", $message = "", $class = "alert alert-success mt-3") {
    if (!empty($name)) {
      if (!empty($message) && empty($_SESSION[$name])) {
        if (!empty($_SESSION[$name . "_class"])) {
          unset($_SESSION[$name . "_class"]);
        }

        $_SESSION[$name] = $message;
        $_SESSION[$name . "_class"] = $class;
      } elseif (empty($message) && !empty($_SESSION[$name])) {
        $class = !empty($_SESSION[$name . "_class"]) ? $_SESSION[$name . "_class"] : "";
        echo '<div class="font-weight-bold ' . $class . '" id="msg-flash">' . $_SESSION[$name] . '</div>';
        unset($_SESSION[$name]);
        unset($_SESSION[$name . "_class"]);
      }
    }
  }

  function isLoggedIn() {
    if (isset($_SESSION["user_id"])) {
      return true;
    } else {
      return false;
    }
  }

  function isAdmin() {
    if (isset($_SESSION["user_id"]) && $_SESSION["user_role"] == "admin") {
      return true;
    } else {
      return false;
    }
  }

  function isUser() {
    if (isset($_SESSION["user_id"]) && $_SESSION["user_role"] == "user") {
      return true;
    } else {
      return false;
    }
  }
?>
