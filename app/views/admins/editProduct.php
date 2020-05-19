<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

  <div class="card">
    <div class="card-body mx-auto">
      <h4 class="header-title">Edit product</h4>
      <?php flash("update_success"); ?>
      <form name="edit-product" method="post" action="<?php echo URLROOT; ?>/admins/editProduct/<?php echo $data["product"]->sku; ?>">
        <div class="row">
          <div class="form-group col-sm-3">
            <label for="sku" class="col-form-label">SKU</label>
            <input class="form-control" type="text" value="<?php echo $data["product"]->sku; ?>" name="sku" readonly>
          </div>
          <div class="form-group col-sm-3">
            <label class="col-form-label">Category <span class="text-danger small font-weight-bold">*</span></label>
            <select class="custom-select" name="category">
              <?php for ($i = 0; $i < $data["totalCategories"]; $i++) : ?>
                <option value="<?php echo $data["categories"][$i]->categoryID; ?>"
                  <?php echo ($data["categories"][$i]->categoryID == $data["product"]->category_id)? 'selected' : '' ?>><?php echo $data["categories"][$i]->categoryName; ?></option>
              <?php endfor; ?>
            </select>
          </div>
          <div class="form-group col-sm-3">
            <label class="col-form-label">Available <span class="text-danger small font-weight-bold">*</span></label>
            <select class="custom-select" name="available">
              <option value="1" <?php echo ($data["product"]->available == 1)? 'selected' : '' ?>>Available</option>
              <option value="0" <?php echo ($data["product"]->available == 0)? 'selected' : '' ?>>Unavailable</option>
            </select>
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-5">
            <label for="product-name" class="col-form-label">Name <span class="text-danger small font-weight-bold">*</span></label>
            <input class="form-control<?php echo (!empty($data["name_err"])) ? " is-invalid" : ""; ?>" type="text" value="<?php echo $data["product"]->productName; ?>" name="product-name">
            <span class="text-danger small"><?php echo $data["name_err"]; ?></span>
          </div>
          <div class="form-group col-sm-2">
            <label for="price" class="col-form-label">Price <span class="text-danger small font-weight-bold">*</span></label>
            <input class="form-control<?php echo (!empty($data["price_err"])) ? " is-invalid" : ""; ?>" type="number" value="<?php echo $data["product"]->price; ?>" step="0.001" name="price">
            <span class="text-danger small"><?php echo $data["price_err"]; ?></span>
          </div>
          <div class="form-group col-sm-2">
            <label for="quantity" class="col-form-label">Quantity <span class="text-danger small font-weight-bold">*</span></label>
            <input class="form-control<?php echo (!empty($data["quantity_err"])) ? " is-invalid" : ""; ?>" type="number" value="<?php echo $data["product"]->quantity; ?>" step="0.001" name="quantity">
            <span class="text-danger small"><?php echo $data["quantity_err"]; ?></span>
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-9">
            <label for="description" class="col-form-label">Description <span class="text-danger small font-weight-bold">*</span></label>
            <textarea class="form-control<?php echo (!empty($data["description_err"])) ? " is-invalid" : ""; ?>" name="description"><?php echo $data["product"]->description; ?></textarea>
            <span class="text-danger small"><?php echo $data["description_err"]; ?></span>
          </div>
        </div>

        <input type="submit" class="btn btn-primary mt-4 pr-4 pl-4" value="Update">
      </form>
    </div>
  </div>

  <script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
