<?php require_once APPROOT . "/views/inc/header.php"; ?>

<div class="container">
  <div class="row mt-5 mb-5">
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="card card-body mb-5">
        <h4 class="m-text14 p-b-7">
          User
        </h4>

        <ul>
          <li class="p-t-4">
            <a href="<?php echo URLROOT; ?>/users/profile">
              Profile
            </a>
          </li>
          <li class="p-t-4">
            <a href="<?php echo URLROOT; ?>/users/changepassword">
              Change password
            </a>
          </li>
          <li class="p-t-4">
            <a href="<?php echo URLROOT; ?>/users/orders" class="s-text13 active1">
              Orders
            </a>
          </li>
          <?php if (!isUser()) : ?>
            <li class="p-t-4">
              <a href="<?php echo URLROOT; ?>/admins">
                To Admin Page
              </a>
            </li>
          <?php endif; ?>
        </ul>
      </div>
    </div>

    <div class="col-sm-6 col-md-8 col-lg-9 ">
      <div class="card card-body">
        <h2>My Orders</h2>
        <hr>
        <table class="my-table">
          <tr>
            <th>Order Code</th>
            <th>Time</th>
            <th>Total</th>
            <th>Status</th>
          </tr>
          <?php  for ($i = 0; $i < $data["totalOrder"]; $i++) : ?>
            <tr>
              <td><a class="text-primary" href="<?php echo URLROOT; ?>/orders/details/<?php echo $data["orders"][$i]->order_code; ?>"><?php echo $data["orders"][$i]->order_code; ?></a></td>
              <td><?php echo $data["orders"][$i]->created_at; ?></td>
              <td>$<?php echo round($data["orders"][$i]->total + $data["shipping"], 3); ?></td>
              <td><?php echo ucwords($data["orders"][$i]->status); ?></td>
            </tr>
          <?php endfor; ?>
        </table>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
