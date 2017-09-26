document.addEventListener("turbolinks:load", function() {
  $('.link-to-show-replies').on('click', function(){
    $(this).addClass('hidden')
    $(this).next('.replies-row').removeClass('hidden');
  })

  $('.new_comment').keypress(function(e){
    if(e.which == 13){
      $(this).closest('form').submit();
    }
  });
  $('.reply-to-a-comment').on('click', function(){
    $(this).next('.new-reply-form').toggleClass('hidden');
  });

});
