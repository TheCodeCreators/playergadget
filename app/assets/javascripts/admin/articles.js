document.addEventListener("turbolinks:load", function() {
  // CKEDITOR.replace( 'article-body' );
  $('.article-image-uploader').on('change', function(){
    input = this
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev')
          .attr('src', e.target.result)
          .width(320)
          .height(180);
      };
      reader.readAsDataURL(input.files[0]);
    }
  });
  $(function () {
      $('.datepicker').datepicker();
  });
});
