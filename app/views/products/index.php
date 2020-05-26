<?php require_once APPROOT . "/views/inc/header.php"; ?>
  <!-- Title Page -->
  <section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(<?php echo URLROOT; ?>/images/master-slide1.png);">
    <h2 class="l-text2 t-center">Figure Planet</h2>
    <p class="m-text13 t-center">New Arrivals Figure 2019</p>
  </section>


  <!-- Content page -->
  <section class="bgwhite p-t-55 p-b-65">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
          <div class="leftbar p-r-20 p-r-0-sm">
            <!--  -->
            <h4 class="m-text14 p-b-7">
              Categories
            </h4>

            <ul class="p-b-54">
              <li class="p-t-4">
                <a data-categoryCode="all" href="<?php echo URLROOT; ?>/products/search/all" class="s-text13<?php if ( $data["filter"]["categoryCode"] == "all") echo " active1"; ?>">
                  All
                </a>
              </li>

              <?php for ($i = 0; $i < $data["totalCategories"]; $i++) : ?>
                <?php if ($data["category"][$i]->categoryCode != "others") : ?>
                  <li class="p-t-4">
                    <a data-categoryCode="<?php echo $data["category"][$i]->categoryCode ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["category"][$i]->categoryCode; ?>" class="s-text13<?php if ( $data["filter"]["categoryCode"] == $data["category"][$i]->categoryCode) echo " active1"; ?>">
                      <?php echo $data["category"][$i]->categoryName; ?>
                    </a>
                  </li>
                <?php endif; ?>
              <?php endfor; ?>

              <li class="p-t-4">
                <a data-categoryCode="others" href="<?php echo URLROOT; ?>/products/search/others" class="s-text13<?php if ($data["filter"]["categoryCode"] == "others") echo " active1"; ?>">
                  Others
                </a>
              </li>
            </ul>

            <!--  -->
            <h4 class="m-text14 p-b-32">
              Filters
            </h4>

            <div class="filter-price p-t-22 p-b-50 bo3">
              <div class="m-text15 p-b-17">
                Price
              </div>

              <div class="wra-filter-bar">
                <span class="s-text13">From:</span>
                <div class="bo4 of-hidden size15 m-b-20">
                  <input id="minPrice" class="sizefull s-text7 p-l-22 p-r-22" type="number" name="minPrice" placeholder="from" min="0" max="9999" value="<?php echo $data["filter"]["priceFrom"]; ?>">
						    </div>
                <span class="s-text13">To:</span>
                <div class="bo4 of-hidden size15 m-b-20">
                  <input id="maxPrice" class="sizefull s-text7 p-l-22 p-r-22" type="number" name="maxPrice" placeholder="to" min="1" max="9999" value="<?php echo $data["filter"]["priceTo"]; ?>">
						    </div>
              </div>

              <div class="flex-sb-m flex-w p-t-16">
                <div class="w-size11">
                  <!-- Button -->
                  <button class="flex-c-m size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4" id="filter-price">
                    Filter
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
          <!--  -->
          <div class="flex-sb-m flex-w p-b-35">
            <div class="flex-w">
              <!--  -->
              <div class="search-product bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
                <input id="search-product" class="s-text7 size15 p-l-23 p-r-50" type="text" name="search-product" placeholder="Search Products..." value="<?php if ($data["filter"]["name"] != "none") echo $data["filter"]["name"]; ?>">
              </div>

              <!--  -->
              <div class="rs2-select2 bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
                <select id="sort" class="selection-2" name="sorting">
                  <option value="default"<?php if ($data["filter"]["sort"] == "default") echo " selected"; ?>>Default Sorting</option>
                  <option value="a-to-z"<?php if ($data["filter"]["sort"] == "a-to-z") echo " selected"; ?>>Name: A-Z</option>
                  <option value="z-to-a"<?php if ($data["filter"]["sort"] == "z-to-a") echo " selected"; ?>>Name: Z-A</option>
                  <option value="low-to-high"<?php if ($data["filter"]["sort"] == "low-to-high") echo " selected"; ?>>Price: low to high</option>
                  <option value="high-to-low"<?php if ($data["filter"]["sort"] == "high-to-low") echo " selected"; ?>>Price: high to low</option>
                </select>
              </div>

              <div class="m-t-10 m-b-5">
                  <input id="btn-search" type="button" class="flex-c-m size4 bg7 bo-rad-15 hov1 s-text14 trans-0-4 m-t-8 p-r-6 p-l-6" value="Search">
              </div>
            </div>

            <span class="s-text8 p-t-5 p-b-5">
              Showing <?php echo ($data["totalProducts"] != 0)? $data["filter"]["offset"] + 1 : 0; ?>–<?php echo ($data["totalProducts"] != 0)? $data["filter"]["offset"] + $data["productsPerPage"] : 0; ?> of <?php echo $data["totalProducts"]; ?> results
            </span>
          </div>

          <!-- Product -->
          <div id="display-products" class="row">
            <?php if ($data["totalProducts"] == 0) : ?>

            <?php endif; ?>

            <?php for ($i = 0; $i < $data["productsPerPage"]; $i++) : ?>
              <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                <!-- Block2 -->
                <div class="block2">
                  <div class="block2-img wrap-pic-w of-hidden pos-relative block2-label">
                    <img src="<?php echo URLROOT . '/' . $data["products"][$i]->imgPath; ?>" alt="IMG-PRODUCT">

                    <div class="block2-overlay trans-0-4">
                      <span class="block2-btn-addwishlist hov-pointer trans-0-4">
                        <i class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
                        <i class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
                      </span>

                      <div class="block2-btn-addcart w-size1 trans-0-4" data-sku="<?php echo $data["products"][$i]->sku; ?>">
                        <!-- Button -->
                        <button class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
                          Add to Cart
                        </button>
                      </div>
                    </div>
                  </div>

                  <div class="block2-txt p-t-20">
                    <a href="<?php echo URLROOT; ?>/products/product/<?php echo $data["products"][$i]->sku; ?>" class="block2-name dis-block s-text3 p-b-5">
                      <?php echo $data["products"][$i]->productName; ?>
                    </a>

                    <span class="block2-price m-text6 p-r-5">
                      $<?php echo $data["products"][$i]->price; ?>
                    </span>
                  </div>
                </div>
              </div>
            <?php endfor; ?>

          </div>

          <!-- Pagination -->
          <div class="pagination flex-m flex-w p-t-26">

          <?php if ($data["totalPages"] <= 1) : ?>

            <?php elseif ($data["currentPage"] < 2 && $data["currentPage"] < $data["totalPages"]) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo 1; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo "<<"; ?></a>
                <?php for ($i = $data["currentPage"]; $i <= $data["currentPage"] + 2; $i++) : ?>
                  <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $i; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo $i; ?></a>
            <?php endfor; ?>
            <?php for ($i = $data["currentPage"] ; $i <= $data["currentPage"]; $i++) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $data["totalPages"]; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"])  ?>"><?php echo ">>"; ?></a>
            <?php endfor; ?>



          <?php elseif ($data["currentPage"] > 1 && $data["currentPage"] < $data["totalPages"]) : ?>
            <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo 1; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo "<<"; ?></a>
            <?php for ($i = $data["currentPage"] - 1; $i <= $data["currentPage"] + 1; $i++) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $i; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo $i; ?></a>
            <?php endfor; ?>
            <?php for ($i = $data["currentPage"] ; $i <= $data["currentPage"]; $i++) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $data["totalPages"]; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"])  ?>"><?php echo ">>"; ?></a>
            <?php endfor; ?>


            <?php elseif ($data["currentPage"] = $data["totalPages"]) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo 1; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo "<<"; ?></a>
            <?php for ($i = $data["currentPage"] -2 ; $i <= $data["currentPage"]; $i++) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $i; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"]) echo ' active-pagination'; ?>"><?php echo $i; ?></a>
            <?php endfor; ?>
            <?php for ($i = $data["currentPage"] ; $i <= $data["currentPage"]; $i++) : ?>
              <a data-page="<?php echo $i; ?>" href="<?php echo URLROOT; ?>/products/search/<?php echo $data["pagination"]; ?>/<?php echo $data["totalPages"]; ?>" class="item-pagination flex-c-m trans-0-4<?php if ($i == $data["currentPage"])  ?>"><?php echo ">>"; ?></a>
            <?php endfor; ?>
          <?php else : ?>
          <?php endif; ?>
          </div>
        </div>
      </div>
    </div>
  </section>

  <script src="<?php echo URLROOT; ?>/js/filter-handler.js"></script>
<?php require_once APPROOT . "/views/inc/footer.php"; ?>
