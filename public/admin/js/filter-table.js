$(document).ready(function() {
  // products table
  $('#products-table').DataTable({
    "columnDefs": [{
      "orderable": false,
      "targets": -1
    }]
  });

  // users table
  $('#users-table').DataTable({
    "columnDefs": [{
      "orderable": false,
      "targets": -1
    }]
  });

  // orders table
  $('#orders-table').DataTable({
    "columnDefs": [{
      "orderable": false,
      "targets": -1
    }]
  });
});
