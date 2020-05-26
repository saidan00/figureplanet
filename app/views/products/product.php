<?php require_once APPROOT . "/views/inc/header.php"; ?>

  <!-- breadcrumb -->
  <div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
    <a href="<?php echo URLROOT; ?>/products" class="s-text16">
      Shop
      <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
    </a>

    <a href="<?php echo URLROOT; ?>/products/search/<?php echo $data["product"]->categoryCode; ?>" class="s-text16">
      <?php echo $data["product"]->categoryName; ?>
      <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
    </a>

    <span class="s-text17">
      <?php echo $data["product"]->productName; ?>
    </span>
  </div>

  <!-- Product Detail -->
  <div class="container bgwhite p-t-35 p-b-80">
    <div class="flex-w flex-sb">
      <div class="w-size13 p-t-30 respon5">
        <div class="wrap-slick3 flex-sb flex-w">
          <div class="wrap-slick3-dots"></div>

          <div class="slick3">

            <!-- display thumbnail -->
            <?php for ($i = 0; $i < $data["imgQuantity"]; $i++) : ?>
              <div class="item-slick3" data-thumb="<?php echo URLROOT; ?>/<?php echo $data["images"][$i]; ?>">
                <div class="wrap-pic-w">
                  <img src="<?php echo URLROOT; ?>/<?php echo $data["images"][$i]; ?>" alt="IMG-PRODUCT">
                </div>
              </div>
            <?php endfor; ?>

          </div>
        </div>
      </div>

      <div class="w-size14 p-t-30 respon5">
        <h4 class="product-detail-name m-text16 p-b-13">
          <?php echo $data["product"]->productName; ?>
        </h4>

        <span class="m-text17">
          $<?php echo $data["product"]->price; ?>
        </span>

        <!--  -->
        <div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
          <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
            Description
            <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
            <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
          </h5>

          <div class="dropdown-content dis-none p-t-15 p-b-23">
            <p class="s-text8">
              <?php echo nl2br($data["product"]->description); ?>
            </p>
          </div>
        </div>

        <!--  -->
        <div class="add-product p-t-33 p-b-60">
          <div class="flex-r-m flex-w p-t-10">
            <div class="w-size16 flex-m flex-w">
              <div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
                <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                  <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                </button>

                <input class="size8 m-text18 t-center num-product" type="number" name="num-product" id="num-product" value="1">

                <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                  <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                </button>
              </div>

              <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10" data-sku="<?php echo $data["product"]->sku; ?>">
                <!-- Button -->
                <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
                  Add to Cart
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="p-b-45">
          <span class="s-text8 m-r-35">SKU: <?php echo $data["product"]->sku; ?></span>
          <span class="s-text8">Categories: <?php echo $data["product"]->categoryName; ?></span>
        </div>

      </div>
    </div>
  </div>

  <script>
    document.title = "<?php echo SITENAME . ' - ' . $data["product"]->productName; ?>";
  </script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
