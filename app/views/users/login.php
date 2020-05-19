<?php require_once APPROOT . "/views/inc/header.php"; ?>

  <div class="container">
    <div class="row">
      <div class="col-md-6 mx-auto">
        <div class="card card-body mt-5 mb-5">
          <h2>Login</h2>
          <?php flash("register_success"); ?>
          <hr>
          <form action="<?php echo URLROOT; ?>/users/login" method="post">
            <div class="form-group">
              <label for="email">Email <span class="text-danger font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="email" name="email" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["email_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["email"]; ?>" placeholder="Email">
              </div>
              <span class="text-danger small"><?php echo $data["email_err"]; ?></span>
            </div>

            <div class="form-group">
              <label for="password">Password <span class="text-danger font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["password"]; ?>" placeholder="Password">
              </div>
              <span class="text-danger small"><?php echo $data["password_err"]; ?></span>
            </div>

            <div class="row">
              <div class="col">
                <input type="submit" value="Login" class="btn bg1 btn-block text-light hov1 bo-rad-23">
              </div>
              <div class="col">
                <a href="<?php echo URLROOT; ?>/users/register" class="btn btn-light btn-block hov1 bo-rad-23">No account? Register</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
