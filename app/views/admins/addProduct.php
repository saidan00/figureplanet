<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

  <div class="card">
    <div class="card-body mx-auto">
      <h4 class="header-title">Add product</h4>
      <?php flash("update_success"); ?>
      <form name="add-product" method="post" action="<?php echo URLROOT; ?>/admins/addProduct" enctype="multipart/form-data">
        <div class="row">
          <div class="form-group col-sm-6">
            <label class="col-form-label">Category <span class="text-danger small font-weight-bold">*</span></label>
            <select class="custom-select" name="category">
              <?php for ($i = 0; $i < $data["totalCategories"]; $i++) : ?>
                <option value="<?php echo $data["categories"][$i]->categoryID; ?>"><?php echo $data["categories"][$i]->categoryName; ?></option>
              <?php endfor; ?>
            </select>
          </div>
          <div class="form-group col-sm-6">
            <label class="col-form-label">Available <span class="text-danger small font-weight-bold">*</span></label>
            <select class="custom-select" name="available">
              <option value="1">Available</option>
              <option value="0" selected>Unavailable</option>
            </select>
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-8">
            <label for="product-name" class="col-form-label">Name <span class="text-danger small font-weight-bold">*</span></label>
            <input class="form-control<?php echo (!empty($data["name_err"])) ? " is-invalid" : ""; ?>" type="text" value="<?php echo $data["productName"]; ?>" name="product-name">
            <span class="text-danger small"><?php echo $data["name_err"]; ?></span>
          </div>
          <div class="form-group col-sm-4">
            <label for="price" class="col-form-label">Price <span class="text-danger small font-weight-bold">*</span></label>
            <input class="form-control<?php echo (!empty($data["price_err"])) ? " is-invalid" : ""; ?>" type="number" value="<?php echo $data["price"]; ?>" step="0.001" name="price">
            <span class="text-danger small"><?php echo $data["price_err"]; ?></span>
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-12">
            <label for="description" class="col-form-label">Description <span class="text-danger small font-weight-bold">*</span></label>
            <textarea class="form-control<?php echo (!empty($data["description_err"])) ? " is-invalid" : ""; ?>" name="description"><?php echo $data["description"]; ?></textarea>
            <span class="text-danger small"><?php echo $data["description_err"]; ?></span>
          </div>
        </div>

        <input type="submit" class="btn btn-primary mt-4 pr-4 pl-4" value="Add">
      </form>
    </div>
  </div>

  <script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
