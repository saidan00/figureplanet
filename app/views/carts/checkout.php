<?php require_once APPROOT . "/views/inc/header.php"; ?>
<?php if (isLoggedIn()) : ?>
  <?php if ($data["cart"]["totalCart"] == 0) : ?>
    <section id="cart-logged-in" class="bg-title-page p-t-50 p-b-40 flex-col-c-m">
      <h2>Nothing to show</h2>
      <p>
        Your cart is empty. Please buy something.
      </p>
    </section>
  <?php else: ?>
    <div class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <div class="card card-body mt-5 mb-5">
            <h2>Order Details</h2>
            <hr>
            <form name="checkout-form" action="<?php echo URLROOT; ?>/carts/checkout" method="post">
              <div class="row">
                <div class="form-group col">
                  <label for="firstname">First name <span class="text-danger small font-weight-bold">*</span></label>
                  <div class="bo4">
                    <input type="text" name="firstname" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["firstname_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["user"]->firstname; ?>" placeholder="First name">
                  </div>
                  <span class="text-danger small"><?php echo $data["firstname_err"]; ?></span>
                </div>

                <div class="form-group col">
                  <label for="lastname">Last name <span class="text-danger small font-weight-bold">*</span></label>
                  <div class="bo4">
                    <input type="text" name="lastname" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["lastname_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["user"]->lastname; ?>" placeholder="Last name">
                  </div>
                  <span class="text-danger small"><?php echo $data["lastname_err"]; ?></span>
                </div>
              </div>

              <div class="form-group">
                <label for="phone">Phone <span class="text-danger small font-weight-bold">*</span></label>
                <div class="bo4">
                  <input type="text" name="phone" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["phone_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["user"]->phone; ?>" placeholder="Phone">
                </div>
                <span class="text-danger small"><?php echo $data["phone_err"]; ?></span>
              </div>

              <div class="form-group">
                <label for="address">Address <span class="text-danger small font-weight-bold">*</span></label>
                <div class="bo4">
                  <input type="text" name="address" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["address_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["user"]->address; ?>" placeholder="Address">
                </div>
                <span class="text-danger small"><?php echo $data["address_err"]; ?></span>
              </div>

              <div class="form-group">
                <label for="payment">Payment <span class="text-danger small font-weight-bold">*</span></label>
                <div>
                  <input type="radio" name="payment" value="cod" checked> <span class="small text-secondary">COD</span><br>
                  <input type="radio" name="payment" value="bank-transfer" disabled> <span class="small text-secondary">Bank Transfer (developing)</span><br>
                  <input type="radio" name="payment" value="credit-card" disabled> <span class="small text-secondary">Credit Card (developing)</span>
                </div>
                <span class="text-danger small"><?php echo $data["payment_err"]; ?></span>
              </div>

              <div class="row">
                <div class="col mb-2">
                  <input id="checkout-btn" type="submit" value="Checkout" class="btn bg1 btn-block text-light hov1 bo-rad-23">
                </div>
                <div class="col">
                  <a href="<?php echo URLROOT; ?>/carts" class="btn btn-light btn-block hov1 bo-rad-23">Edit cart</a>
                </div>
              </div>
            </form>
          </div>
        </div>

        <div class="col-md-6 mx-auto">
          <div class="card card-body mt-5 mb-5">
            <h5 class="m-text20 p-b-24">
              Cart
            </h5>

            <!--  -->
            <table id="checkout-table">
              <tr >
                <th>Product</th>
                <th class="quantity"> Quantity</th>
                <th>Price</th>
              </tr>
              <?php for ($i = 0; $i < $data["cart"]["totalCart"]; $i++) : ?>
                <tr>
                  <td><?php echo $data["cart"]["cart"][$i]->productName; ?></td>
                  <td class="quantity"><?php echo $data["cart"]["cart"][$i]->quantity; ?></td>
                  <td><?php echo "$" . $data["cart"]["cart"][$i]->price *  $data["cart"]["cart"][$i]->quantity; ?></td>
                </tr>
              <?php endfor; ?>
            </table>

            <hr>

            <h5 class="m-text20 p-b-24">
              Cart Totals
            </h5>

            <!--  -->
            <div class="flex-w flex-sb-m p-b-12">
              <span class="s-text18 w-size19 w-full-sm">
                Subtotal:
              </span>

              <span class="m-text21 w-size20 w-full-sm" data-name="sub-total">
                $<?php echo $data["cart"]["subTotal"]; ?>
              </span>
            </div>

            <!--  -->
            <div class="flex-w flex-sb bo10 p-t-15 p-b-20">
              <span class="s-text18 w-size19 w-full-sm">
                Shipping:
              </span>

              <span class="m-text21 w-size20 w-full-sm" data-name="shipping">
                $<?php echo $data["cart"]["shipping"]; ?>
              </span>
            </div>

            <!--  -->
            <div class="flex-w flex-sb-m p-t-26 p-b-30">
              <span class="m-text22 w-size19 w-full-sm">
                Total:
              </span>

              <span class="m-text21 w-size20 w-full-sm">
                <span class="m-text21 w-size20 w-full-sm" data-name="total">
                  $<?php echo $data["cart"]["total"]; ?>
                </span>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>
    <script src="<?php echo URLROOT; ?>/js/checkout-btn.js"></script>
  <?php endif; ?>
<?php endif; ?>
<?php require_once APPROOT . "/views/inc/footer.php"; ?>
