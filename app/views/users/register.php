<?php require_once APPROOT . "/views/inc/header.php"; ?>

  <div class="container">
    <div class="row">
      <div class="col-md-6 mx-auto">
        <div class="card card-body mt-5 mb-5">
          <h2>Register</h2>
          <hr>
          <form action="<?php echo URLROOT; ?>/users/register" method="post">
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
              <label for="email">Email <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="email" name="email" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["email_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["email"]; ?>" placeholder="Email">
              </div>
              <span class="text-danger small"><?php echo $data["email_err"]; ?></span>
            </div>

            <div class="form-group">
              <label for="password">Password <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["password"]; ?>" placeholder="Password">
              </div>
              <span class="text-danger small"><?php echo $data["password_err"]; ?></span>
            </div>

            <div class="form-group">
              <label for="confirm_password">Confirm Password <span class="text-danger small font-weight-bold">*</span></label>
              <div class="bo4">
                <input type="password" name="confirm_password" class="sizefull s-text7 p-l-22 p-r-22 form-control form-control-lg<?php echo (!empty($data["confirm_password_err"])) ? " is-invalid" : ""; ?>" value="<?php echo $data["confirm_password"]; ?>" placeholder="Repeat your password">
              </div>
              <span class="text-danger small"><?php echo $data["confirm_password_err"]; ?></span>
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
              <div class="col mb-2">
                <input type="submit" value="Register" class="btn bg1 btn-block text-light hov1 bo-rad-23">
              </div>
              <div class="col">
                <a href="<?php echo URLROOT; ?>/users/login" class="btn btn-light btn-block hov1 bo-rad-23">Have an account? Login</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="<?php echo URLROOT; ?>/js/auto-focus-first-error.js"></script>

<?php require_once APPROOT . "/views/inc/footer.php"; ?>
