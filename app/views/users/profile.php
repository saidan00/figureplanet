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
            <a href="<?php echo URLROOT; ?>/users/profile" class="s-text13 active1">
              Profile
            </a>
          </li>
          <li class="p-t-4">
            <a href="<?php echo URLROOT; ?>/users/changepassword">
              Change password
            </a>
          </li>
          <li class="p-t-4">
            <a href="<?php echo URLROOT; ?>/users/orders">
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

    <div class="col-sm-6 col-md-8 col-lg-9">
      <div class="card card-body">
        <h2>Profile</h2>
        <?php flash("update_profile_success"); ?>
        <hr>
        <form action="<?php echo URLROOT; ?>/users/profile" method="post">
          <div class="row">
            <div class="form-group col">
              <label for="firstname">First name <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="text" name="firstname" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["firstname_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["firstname"]; ?>" placeholder="First name">
              </div>
              <span class="text-danger small"><?php echo $data["firstname_err"]; ?></span>
            </div>

            <div class="form-group col">
              <label for="lastname">Last name <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="text" name="lastname" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["lastname_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["lastname"]; ?>" placeholder="Last name">
              </div>
              <span class="text-danger small"><?php echo $data["lastname_err"]; ?></span>
            </div>
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <div class="bo4">
              <input type="email" name="email" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg" value="<?php echo $data["email"]; ?>" placeholder="Email" readonly>
            </div>
          </div>

          <div class="form-group">
            <label for="gender">Gender</label>
            <div>
                <input type="radio" name="gender" value="male" <?php echo ($data["gender"] == "male")? "checked" : ""; ?>> <span class="small text-secondary">Male</span><br>
                <input type="radio" name="gender" value="female" <?php echo ($data["gender"] == "female")? "checked" : ""; ?>> <span class="small text-secondary">Female</span>
            </div>
            <span class="text-danger small"><?php echo $data["gender_err"]; ?></span>
          </div>

          <div class="form-group">
            <label for="phone">Phone <span class="text-danger small font-weight-bold">*</span></label>
            <div class="bo4">
              <input type="text" name="phone" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["phone_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["phone"]; ?>" placeholder="Phone">
            </div>
            <span class="text-danger small"><?php echo $data["phone_err"]; ?></span>
          </div>

          <div class="form-group">
            <label for="address">Address <span class="text-danger small font-weight-bold">*</span></label>
            <div class="bo4">
              <input type="text" name="address" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["address_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["address"]; ?>" placeholder="Address">
            </div>
            <span class="text-danger small"><?php echo $data["address_err"]; ?></span>
          </div>

          <div class="row">
            <div class="col-md-4 ml-auto">
              <input type="submit" value="Update" class="btn bg1 btn-block text-light hov1 bo-rad-23">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
