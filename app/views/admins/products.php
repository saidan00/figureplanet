<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

<div>
  <div class="card">
    <div class="card-body">
      <div>
        <h4 class="header-title d-inline-block">Products</h4>
        <a href="<?php echo URLROOT; ?>/admins/addProduct">(add product)</a>
      </div>
      <div class="single-table">
          <div class="table-responsive">
            <table class="table" id="products-table">
              <thead class="text-uppercase bg-info">
                <tr class="text-white">
                  <th scope="col">SKU</th>
                  <th scope="col">Name</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Price</th>
                  <th scope="col">Category</th>
                  <th scope="col">Available</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <?php for ($i = 0; $i < $data["totalProducts"]; $i++) : ?>
                <tr>
                  <td><?php echo $data["products"][$i]->sku; ?></td>
                  <td><?php echo $data["products"][$i]->productName; ?></td>
                  <td><?php echo $data["products"][$i]->quantity; ?></td>
                  <td>$<?php echo $data["products"][$i]->price; ?></td>
                  <td><?php echo $data["products"][$i]->categoryName; ?></td>
                  <td><?php echo ($data["products"][$i]->available)? "Yes" : "No"; ?></td>
                  <td>
                    <a href="<?php echo URLROOT; ?>/admins/editProduct/<?php echo $data["products"][$i]->sku; ?>" target="_blank"><i class="fa fa-edit fa-lg text-dark"></i></a>
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
