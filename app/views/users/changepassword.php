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
            <a href="<?php echo URLROOT; ?>/users/changepassword" class="s-text13 active1">
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
        <h2>Password</h2>
        <?php flash("update_profile_success"); ?>
        <hr>
        <form action="<?php echo URLROOT; ?>/users/changepassword" method="post">
            <div class="form-group">
              <label for="password">Current Password <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["password"]; ?>" placeholder="Password">
              </div>
              <span class="text-danger small"><?php echo $data["password_err"]; ?></span>
            </div>

            <div class="form-group">
              <label for="new_password">New Password <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="new_password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["new_password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["new_password"]; ?>" placeholder="New Password">
              </div>
              <span class="text-danger small"><?php echo $data["new_password_err"]; ?></span>
            </div>

            <div class="form-group">
              <label for="confirm_password">Confirm Password <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="confirm_password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["confirm_password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["confirm_password"]; ?>" placeholder="Repeat your password">
              </div>
              <span class="text-danger small"><?php echo $data["confirm_password_err"]; ?></span>
            </div>

          <div class="row">
            <div class="col-md-4 ml-auto">
              <input type="submit" value="Change" class="btn bg1 btn-block text-light hov1 bo-rad-23">
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
