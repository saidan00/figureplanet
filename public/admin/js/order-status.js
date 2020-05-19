$(document).ready(function() {
  let form = document.forms['order-status'];
  let status = document.forms['order-status']['status'];
  let selectedOption = $(status).children("option:selected").val();
  $(status).on('change', function() {
    swal({
      title: "Change status",
      text: "Are you want to change status of this order?",
      icon: "warning",
      buttons: true
    })
    .then((isChange) => {
      if (isChange) {
        form.submit();
      } else {
        $(status).val(selectedOption);
      }
    });
  });
});
