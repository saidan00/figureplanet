<?php require_once APPROOT . "/views/inc/header_admin.php"; ?>
  <div class="container mt-5 mb-5">
    <h4 class="header-title d-inline-block">Statistics</h4>
    <div class="row">
      <div class="col-md-2 mr-1">
        <label for="benginDate">Type:</label>
        <select id="statistic-types" name="type" class="form-control">
          <option value="a">a</option>
          <option value="b">b</option>
          <option value="c">c</option>
        </select>
      </div>
      <div class="col-md-2 mr-1">
        <label for="benginDate">From:</label>
        <input id="beginDate" name="beginDate" class="form-control" type="date" value="">
      </div>
      <div class="col-md-2 mr-1">
        <label for="endDate">To:</label>
        <input id="endDate" name="endDate" class="form-control" type="date" value="">
      </div>
      <div class="col-md-1">
        <label for="mybtn">&nbsp;</label>
        <button id="mybtn" name="mybtn" class="btn btn-primary form-control">View</button>
      </div>
    </div>

    <div class="chart-container" style="position:relative;">
      <canvas id="myChart"></canvas>
    </div>
  </div>

  <script src="<?php echo URLROOT; ?>/admin/js/mychart.js"></script>
<?php require_once APPROOT . "/views/inc/footer_admin.php"; ?>
