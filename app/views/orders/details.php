<?php require_once APPROOT . "/views/inc/header.php"; ?>

<!-- breadcrumb -->
<div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
  <a href="<?php echo URLROOT; ?>/users/orders" class="s-text16">
    Orders
    <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
  </a>

  <span class="s-text17">
    <?php echo $data["details"][0]->order_code; ?>
  </span>
</div>

<div class="container p-t-50 p-b-70">
  <table id="order-details-table">
    <tr>
      <th></th>
      <th>Product</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total</th>
    </tr>
    <?php  for ($i = 0; $i < $data["totalDetails"]; $i++) : ?>
      <tr class="table-row">
        <td>
          <div class="order-details-img"><img src="<?php echo URLROOT . '/' . $data["details"][$i]->imgPath; ?>"></div>
        </td>
        <td class="p-r-10"><a href="<?php echo URLROOT . '/products/product/' .  $data["details"][$i]->product_sku; ?>"><?php echo $data["details"][$i]->productName; ?></a></td>
        <td>$<?php echo $data["details"][$i]->price; ?></td>
        <td><?php echo $data["details"][$i]->product_quantity; ?></td>
        <td>$<?php echo $data["details"][$i]->total_price; ?></td>
      </tr>
    <?php endfor; ?>
  </table>

  <div class="card card-body mt-5 mb-5">
    <table>
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
    </table>
  </div>
</div>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
