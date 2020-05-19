<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

<div>
  <div class="card">
    <div class="card-body">
      <div>
        <h4 class="header-title d-inline-block">Order #<?php echo $data["order"]->order_code; ?></h4>
      </div>
      <div class="single-table">
          <div class="table-responsive">
            <table class="table" id="orders-table">
              <thead class="text-uppercase bg-info">
                <tr class="text-white">
                  <th>Product</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <?php for ($i = 0; $i < $data["totalDetails"]; $i++) : ?>
                <tr>
                  <td class="p-r-10"><a href="<?php echo URLROOT . '/admins/editProduct/' .  $data["details"][$i]->product_sku; ?>"><?php echo $data["details"][$i]->productName; ?></a></td>
                  <td>$<?php echo $data["details"][$i]->price; ?></td>
                  <td><?php echo $data["details"][$i]->product_quantity; ?></td>
                  <td>$<?php echo $data["details"][$i]->total_price; ?></td>
                </tr>
                <?php endfor; ?>
              </tbody>
            </table>

            <hr>

            <table class="my-table">
              <tr>
                <td class="font-weight-bold">Name:</td>
                <td class="p-l-10"><?php echo $data["order"]->firstname . " " . $data["order"]->lastname; ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Phone:</td>
                <td class="p-l-10"><?php echo $data["order"]->phone; ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Address:</td>
                <td class="p-l-10"><?php echo $data["order"]->address; ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Payment:</td>
                <td class="p-l-10"><?php echo $data["order"]->payment; ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Subtotal:</td>
                <td class="p-l-10">$<?php echo round($data["subTotal"], 3); ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Shipping:</td>
                <td class="p-l-10">$<?php echo round($data["shipping"], 3); ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Total:</td>
                <td class="p-l-10">$<?php echo round($data["total"], 3); ?></td>
              </tr>
              <tr>
                <td class="font-weight-bold">Status:</td>
                <td class="p-l-10">
                  <form name="order-status" action="<?php echo URLROOT; ?>/admins/orderDetails/<?php echo $data["order"]->order_code; ?>" method="POST">
                      <select name="status">
                          <option value="processing" <?php echo ($data["order"]->status == "processing")? 'selected' : '' ?>>Processing</option>
                          <option value="delivering" <?php echo ($data["order"]->status == "delivering")? 'selected' : '' ?>>Delivering</option>
                          <option value="success" <?php echo ($data["order"]->status == "success")? 'selected' : '' ?>>Success</option>
                          <option value="canceled" <?php echo ($data["order"]->status == "canceled")? 'selected ' : '' ?>>Canceled</option>
                      </select>
                  </form>
                </td>
              </tr>
            </table>
          </div>
        </div>
    </div>
  </div>
</div>
<!-- table info end -->

<script src="<?php echo URLROOT; ?>/admin/js/order-status.js"></script>

<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
