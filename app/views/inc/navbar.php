  <!-- Header -->
  <header class="header1">
    <!-- Header desktop -->
    <div class="container-menu-header">
      <div class="topbar"></div>
      <div class="wrap_header">
        <!-- Logo -->
        <a href="<?php echo URLROOT; ?>" class="logo">
          <img src="<?php echo URLROOT; ?>/images/icons/logo.png" alt="IMG-LOGO">
        </a>

        <!-- Menu -->
        <div class="wrap_menu">
          <nav class="menu">
            <ul class="main_menu">
              <li>
                <a href="<?php echo URLROOT; ?>">Home</a>
              </li>

              <li>
                <a href="<?php echo URLROOT; ?>/products">Shop</a>
              </li>

              <li>
                <a href="<?php echo URLROOT; ?>/pages/about">About</a>
              </li>

              <li>
                <a href="<?php echo URLROOT; ?>/pages/contact">Contact</a>
              </li>
            </ul>
          </nav>
        </div>

        <!-- Header Icon -->
        <div class="header-icons">
          <?php if (isLoggedIn()) : ?>
            <a href="<?php echo URLROOT; ?>/users" class="header-wrapicon1 dis-block">Welcome <?php echo $_SESSION["user_name"]; ?></a>
            <span class="linedivide1"></span>
            <a href="<?php echo URLROOT; ?>/users/logout" class="header-wrapicon1 dis-block">Logout</a>
          <?php else : ?>
            <a href="<?php echo URLROOT; ?>/users" class="header-wrapicon1 dis-block">
              <img src="<?php echo URLROOT; ?>/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
            </a>
          <?php endif; ?>

          <span class="linedivide1"></span>

          <div class="header-wrapicon2">
            <a href="<?php echo URLROOT; ?>/carts">
              <img src="<?php echo URLROOT; ?>/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
            </a>
            <span class="header-icons-noti">
              <?php if (isset($_SESSION["total_cart"])) : ?>
                <?php echo $_SESSION["total_cart"]; ?>
              <?php endif; ?>
            </span>

          </div>
        </div>
      </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap_header_mobile">
      <!-- Logo moblie -->
      <a href="<?php echo URLROOT; ?>" class="logo-mobile">
        <img src="<?php echo URLROOT; ?>/images/icons/logo.png" alt="IMG-LOGO">
      </a>

      <!-- Button show menu -->
      <div class="btn-show-menu">
        <!-- Header Icon mobile -->
        <div class="header-icons-mobile">
          <?php if (isLoggedIn()) : ?>
            <a href="<?php echo URLROOT; ?>/users" class="header-wrapicon1 dis-block">
              <img src="<?php echo URLROOT; ?>/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
            </a>
          <?php else : ?>
            <a href="<?php echo URLROOT; ?>/users" class="header-wrapicon1 dis-block">
              <img src="<?php echo URLROOT; ?>/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
            </a>
          <?php endif; ?>

          <span class="linedivide2"></span>

          <div class="header-wrapicon2">
            <a href="<?php echo URLROOT; ?>/carts">
              <img src="<?php echo URLROOT; ?>/images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
            </a>
            <span class="header-icons-noti">
              <?php if (isset($_SESSION["total_carts"])) : ?>
                <?php echo $_SESSION["total_carts"]; ?>
              <?php endif; ?>
            </span>
          </div>
        </div>

        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box">
            <span class="hamburger-inner"></span>
          </span>
        </div>
      </div>
    </div>

    <!-- Menu Mobile -->
    <div class="wrap-side-menu" >
      <nav class="side-menu">
        <ul class="main-menu">
          <li class="item-menu-mobile">
            <a href="<?php echo URLROOT; ?>">Home</a>
          </li>

          <li class="item-menu-mobile">
            <a href="<?php echo URLROOT; ?>/products">Shop</a>
          </li>

          <li class="item-menu-mobile">
            <a href="<?php echo URLROOT; ?>/pages/about">About</a>
          </li>

          <li class="item-menu-mobile">
            <a href="<?php echo URLROOT; ?>/pages/contact">Contact</a>
          </li>

          <?php if (isLoggedIn()) : ?>
            <li class="item-menu-mobile">
              <a href="<?php echo URLROOT; ?>/users/logout">Logout</a>
            </li>
          <?php endif; ?>
        </ul>
      </nav>
    </div>
  </header>
