document.addEventListener("turbolinks:load", function() {
  // On click should display comments.
  // $('.link-to-show-replies').on('click', function(){
  //   $(this).addClass('hidden')
  //   $(this).next('.replies-row').removeClass('hidden');
  // })

  // Auto-submits form on pressing the "enter" key.
  $('.new_comment').keypress(function(e){
    if(e.which == 13){
      $(this).closest('form').submit();
    }
  });

  // Toggles the comment textarea.
  $('.reply-action').on('click', function(){
    $(this).parent().next('.new-reply-form').toggleClass('hidden');
  });

});
