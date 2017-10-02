document.addEventListener("turbolinks:load", function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('.fb-icon').on('click', function(){
    $(this).siblings('.fb-share-button').trigger('click');
  });
  $('.twitter-icon').on('click', function(){
    $(this).siblings('.twitter-share-button')[0].click();
  });
});
