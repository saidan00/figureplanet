<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>

<div>
  <div class="card">
    <div class="card-body">
      <div>
        <h4 class="header-title d-inline-block">Users</h4>
      </div>
      <div class="single-table">
          <div class="table-responsive">
            <table class="table" id="users-table">
              <thead class="text-uppercase bg-info">
                <tr class="text-white">
                  <th scope="col">Email</th>
                  <th scope="col">First name</th>
                  <th scope="col">Last name</th>
                  <th scope="col">Gender</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Address</th>
                  <th scope="col">Role</th>
                  <th scope="col">Status</th> <!-- active or banned -->
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <?php for ($i = 0; $i < $data["totalUsers"]; $i++) : ?>
                <tr>
                  <td><?php echo $data["users"][$i]->email; ?></td>
                  <td><?php echo $data["users"][$i]->firstname; ?></td>
                  <td><?php echo $data["users"][$i]->lastname; ?></td>
                  <td><?php echo $data["users"][$i]->gender; ?></td>
                  <td><?php echo $data["users"][$i]->phone; ?></td>
                  <td><?php echo $data["users"][$i]->address; ?></td>
                  <td><?php echo $data["users"][$i]->role; ?></td>
                  <td><?php echo ($data["users"][$i]->is_banned)? "Banned" : "Active"; ?></td>
                  <td>
                    <a href="<?php echo URLROOT; ?>/admins/editUser/<?php echo $data["users"][$i]->user_id; ?>" target="_blank"><i class="fa fa-edit fa-lg text-dark"></i></a>
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
