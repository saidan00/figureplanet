$(document).ready(function() {
  let resetBtn = document.forms["edit-user"]["reset-password"];
  $(resetBtn).on("change", function() {
    let selectedOption = $(this).children("option:selected").val();
    if (selectedOption == 1) {
      swal({
        title: "Reset Password",
        text: "Are you want to reset password of this user?",
        icon: "warning",
        buttons: true
      })
      .then((isReset) => {
        if (isReset) {
          // do nothing
        } else {
          $(resetBtn).val(0);
        }
      });
    }
  });
});
