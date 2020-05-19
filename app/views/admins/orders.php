<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

<div>
  <div class="card">
    <div class="card-body">
      <div>
        <h4 class="header-title d-inline-block">Orders</h4>
      </div>
      <div class="single-table">
          <div class="table-responsive">
            <table class="table" id="orders-table">
              <thead class="text-uppercase bg-info">
                <tr class="text-white">
                  <th scope="col">Order Code</th>
                  <th scope="col">Time</th>
                  <th scope="col">Total</th>
                  <th scope="col">Email</th>
                  <th scope="col">Status</th>
                  <th scope="col">Info</th>
                </tr>
              </thead>
              <tbody>
                <?php for ($i = 0; $i < $data["totalOrders"]; $i++) : ?>
                <tr>
                  <td><?php echo $data["orders"][$i]->order_code; ?></td>
                  <td><?php echo $data["orders"][$i]->created_at; ?></td>
                  <td>$<?php echo round($data["orders"][$i]->total + $data["shipping"], 3); ?></td>
                  <td><?php echo $data["orders"][$i]->email; ?></td>
                  <td><?php echo ucwords($data["orders"][$i]->status); ?></td>
                  <td>
                    <a href="<?php echo URLROOT; ?>/admins/orderDetails/<?php echo $data["orders"][$i]->order_code; ?>" target="_blank"><i class="fa fa-info-circle fa-lg text-dark"></i></a>
                  </td>
                </tr>
                <?php endfor; ?>
              </tbody>
            </table>
          </div>
        </div>
    </div>
  </div>
</div>
<!-- table info end -->

<script src="<?php echo URLROOT; ?>/admin/js/filter-table.js"></script>

<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
