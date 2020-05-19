$(document).ready(function() {
  $('.block2-btn-addcart').each(function() {
    $(this).on('click', function() {
      swal("Login Required", "Please log in", "error");
    });
  });

  $('.block2-btn-addwishlist').each(function() {
    $(this).on('click', function() {
      swal("Login Required", "Please log in", "error");
    });
  });

  // button add to cart - product detail
  $('.btn-addcart-product-detail').each(function() {
    $(this).on('click', function() {
      swal("Login Required", "Please log in", "error");
    });
  });
});
