<?php require_once APPROOT . "/views/inc/header.php"; ?>

<!-- Title Page -->
<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(<?php echo URLROOT; ?>/images/master-slide1.png);">
  <h2 class="l-text2 t-center">
    Cart
  </h2>
</section>

<!-- Cart -->
<?php if (isLoggedIn()) : ?>
  <?php if ($data["totalCart"] == 0) : ?>
    <section id="cart-logged-in" class="bg-title-page p-t-50 p-b-40 flex-col-c-m">
      <h2>Nothing to show</h2>
      <p>
        Your cart is empty. Please buy something.
      </p>
    </section>
  <?php else: ?>
    <section id="cart-logged-in" class="cart bgwhite p-t-70 p-b-100">
      <div class="container">
        <!-- Cart item -->
        <div class="container-table-cart pos-relative">
          <div class="wrap-table-shopping-cart bgwhite">
            <div id="cart-table">
              <table class="table-shopping-cart">
                <tr class="table-head">
                  <th class="column-1"></th>
                  <th class="column-2">Product</th>
                  <th class="column-3">Price</th>
                  <th class="column-4 p-l-70">Quantity</th>
                  <th class="column-5">Total</th>
                </tr>

                <!-- load cart -->
                  <?php for ($i = 0; $i < $data["totalCart"]; $i++) : ?>
                    <tr id="<?php echo $data["cart"][$i]->sku; ?>" class="table-row" data-sku="<?php echo $data["cart"][$i]->sku; ?>" data-name="cart">
                      <td class="column-1">
                        <div class="cart-img-product b-rad-4 o-f-hidden" data-sku="<?php echo $data["cart"][$i]->sku; ?>">
                          <img src="<?php echo URLROOT . "/" . $data["cart"][$i]->imgPath; ?>" alt="IMG-PRODUCT">
                        </div>
                      </td>
                      <td class="column-2"><a href="<?php echo URLROOT; ?>/products/product/<?php echo $data["cart"][$i]->sku; ?>"><?php echo $data["cart"][$i]->productName; ?></a></td>
                      <td class="column-3">$<?php echo $data["cart"][$i]->price; ?></td>
                      <td class="column-4">
                        <div class="flex-w bo5 of-hidden w-size17">
                          <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                            <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                          </button>

                          <input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="<?php echo $data["cart"][$i]->quantity; ?>">

                          <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                            <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                          </button>
                        </div>
                      </td>
                      <td class="column-5">$<?php echo $data["cart"][$i]->quantity * $data["cart"][$i]->price; ?></td>
                    </tr>
                  <?php endfor; ?>

              </table>
            </div>
          </div>
        </div>

        <div class="flex-w flex-sb-m p-t-25 p-b-25 bo8 p-l-35 p-r-60 p-lr-15-sm">
          <div class="flex-w flex-m w-full-sm">
            <div class="size11 bo4 m-r-10">
              <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="coupon-code" placeholder="Coupon Code">
            </div>

            <div class="size12 trans-0-4 m-t-10 m-b-10 m-r-10">
              <!-- Button -->
              <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" id="btn-coupon">
                Apply coupon
              </button>
            </div>
          </div>
        </div>

        <!-- Total -->
        <div class="bo9 w-size18 p-l-40 p-r-40 p-t-30 p-b-38 m-t-30 m-r-0 m-l-auto p-lr-15-sm">
          <h5 class="m-text20 p-b-24">
            Cart Totals
          </h5>

          <!--  -->
          <div class="flex-w flex-sb-m p-b-12">
            <span class="s-text18 w-size19 w-full-sm">
              Subtotal:
            </span>

            <span class="m-text21 w-size20 w-full-sm" data-name="sub-total">
              $<?php echo $data["subTotal"]; ?>
            </span>
          </div>

          <!--  -->
          <div class="flex-w flex-sb bo10 p-t-15 p-b-20">
            <span class="s-text18 w-size19 w-full-sm">
              Shipping:
            </span>

            <span class="m-text21 w-size20 w-full-sm" data-name="shipping">
              $<?php echo $data["shipping"]; ?>
            </span>
          </div>

          <!--  -->
          <div class="flex-w flex-sb-m p-t-26 p-b-30">
            <span class="m-text22 w-size19 w-full-sm">
              Total:
            </span>

            <span class="m-text21 w-size20 w-full-sm">
              <span class="m-text21 w-size20 w-full-sm" data-name="total">
                $<?php echo $data["total"]; ?>
              </span>
            </span>
          </div>

          <div class="size15 trans-0-4">
            <!-- Button -->
            <a href="<?php echo URLROOT; ?>/carts/checkout">
              <button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
                Proceed to Checkout
              </button>
            </a>
          </div>
        </div>
      </div>
    </section>
  <?php endif; ?>
<?php else : ?>
  <section class="bg-title-page p-t-50 p-b-40 flex-col-c-m">
    <h2>Login Required</h2>
    <p>
      Sorry! Please log in to view your cart.
    </p>
  </section>
<?php endif; ?>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
