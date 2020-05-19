<!--[if lt IE 8]>
          <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
      <![endif]-->
<!-- preloader area start -->
<div id="preloader">
  <div class="loader"></div>
</div>
<!-- preloader area end -->
<!-- main wrapper start -->
<div class="horizontal-main-wrapper">
  <!-- main header area start -->
  <div class="mainheader-area">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-3">
          <div class="logo">
            <a href="<?php echo URLROOT; ?>/admins"><img src="<?php echo URLROOT; ?>/admin/images/icon/logo2.png" alt="logo"></a>
          </div>
        </div>
        <!-- profile info & task notification -->
        <div class="col-md-9 clearfix text-right">
          <div class="clearfix d-md-inline-block d-block">
            <div class="user-profile m-0">
              <img class="avatar user-thumb" src="<?php echo URLROOT; ?>/admin/images/author/avatar.png" alt="avatar">
              <h4 class="user-name dropdown-toggle" data-toggle="dropdown"><?php echo $_SESSION["user_name"]; ?><i class="fa fa-angle-down"></i></h4>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="<?php echo URLROOT; ?>/users/logout">Log Out</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- main header area end -->
  <!-- header area start -->
  <div class="header-area header-bottom">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-9  d-none d-lg-block">
          <div class="horizontal-menu">
            <nav>
              <ul id="nav_menu">
                <li>
                  <a href="<?php echo URLROOT; ?>/admins/products"><i class="fa fa-table"></i><span>products</span></a>
                </li>
                <li>
                  <a href="<?php echo URLROOT; ?>/admins/orders"><i class="fa fa-shopping-cart"></i><span>Orders</span></a>
                </li>
                <li>
                  <a href="<?php echo URLROOT; ?>/admins/users"><i class="fa fa-user-circle"></i><span>Users</span></a>
                </li>
                <li>
                  <a href="<?php echo URLROOT; ?>/admins/statistics"><i class="fa fa-bar-chart"></i><span>Statistics</span></a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- mobile_menu -->
        <div class="col-12 d-block d-lg-none">
          <div id="mobile_menu"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- header area end -->
  <!-- page title area end -->
