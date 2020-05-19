<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

<div class="card">
  <div class="card-body mx-auto">
    <h4 class="header-title">Edit user</h4>
    <?php flash("update_success"); ?>
    <form name="edit-user" method="post" action="<?php echo URLROOT; ?>/admins/editUser/<?php echo $data["user"]->user_id; ?>">
      <div class="row">
        <div class="form-group col-sm-12">
          <label for="email" class="col-form-label">Email</label>
          <input class="form-control" type="text" value="<?php echo $data["user"]->email; ?>" readonly>
        </div>
      </div>
      <div class="row">
        <div class="form-group col-sm-4">
          <label class="col-form-label">Role</label>
          <select class="custom-select" name="role">
            <?php for ($i = 0; $i < $data["totalRoles"]; $i++) : ?>
              <option value="<?php echo $data["roles"][$i]->id; ?>"
                <?php echo ($data["roles"][$i]->id == $data["user"]->role_id)? 'selected' : '' ?>><?php echo $data["roles"][$i]->role; ?></option>
            <?php endfor; ?>
          </select>
        </div>
        <div class="form-group col-sm-4">
          <label class="col-form-label">Active/Banned</label>
          <select class="custom-select" name="is-banned">
            <option value="0" <?php echo ($data["user"]->is_banned == 0)? 'selected' : '' ?>>Active</option>
            <option value="1" <?php echo ($data["user"]->is_banned == 1)? 'selected' : '' ?>>Banned</option>
          </select>
        </div>
        <div class="form-group col-sm-4">
          <label class="col-form-label">Reset Password</label>
          <select class="custom-select" name="reset-password">
            <option value="1">Reset</option>
            <option value="0" selected>No</option>
          </select>
        </div>
      </div>

      <input type="submit" class="btn btn-primary" value="Update">
    </form>
  </div>
</div>

<script src="<?php echo URLROOT; ?>/admin/js/reset-passwd-btn.js"></script>

<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
