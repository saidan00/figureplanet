<?php
  // Load session helper
  require_once "helpers/session_helper.php";

  // Load url helper
  require_once "helpers/url_helper.php";

  // Load config
  require_once "config/config.php";

  // Load libraries
  // require_once "libraries/Core.php";
  // require_once "libraries/Controller.php";
  // require_once "libraries/Database.php";

  // Auto load core libraries
  spl_autoload_register(function($classname) {
    require_once "libraries/" . $classname . ".php";
  });
?>
