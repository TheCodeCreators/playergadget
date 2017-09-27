document.addEventListener("turbolinks:load", function() {
  // Opens the form file button on text click.
  $('.upload-file-text').on('click', function(){
    $('.avatar-file-btn').click();
  });

  // On avatar upload, it shows an image preview.
  $('.avatar-file-btn').on('change', function(){
    input = this
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev')
          .attr('src', e.target.result)
          .width(140)
          .height(140);
      };
      reader.readAsDataURL(input.files[0]);
    }
  });
});
