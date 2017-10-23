document.addEventListener("turbolinks:load", function() {
  // CKEDITOR.replace( 'article-body' );
  $('.article-image-uploader').on('change', function(){
    input = this
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev')
        .attr('src', e.target.result);
        $('.placeholder').addClass('hidden');
      };
      reader.readAsDataURL(input.files[0]);
    }
  });
  $('.datepicker').datepicker({
      dateFormat: 'dd-mm-yy'
  });
  // initializes a select2 with tagging support
  $('.my-tags-input').each(function() {
    $(this).select2({
      tags: true,
      tokenSeparators: [','],
    });
  });
});
