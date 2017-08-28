$(document).ready(function() {
  $(function() {
     $('#flash').delay(2500).fadeIn('slow', function() {
        $(this).delay(2500).fadeOut();
     });
  });
});
