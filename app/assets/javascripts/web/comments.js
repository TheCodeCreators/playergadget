document.addEventListener("turbolinks:load", function() {
  // On click should display comments.
  // $('.link-to-show-replies').on('click', function(){
  //   $(this).addClass('hidden')
  //   $(this).next('.replies-row').removeClass('hidden');
  // })

  // Auto-submits form on pressing the "enter" key.
  $('.new_comment').keydown(function(e){
    if(e.which == 13 && !event.shiftKey){
      e.preventDefault();
      if ($(this).children('textarea').val() != "") {
        $(this).closest('form').submit();
      }
    }
  });

  // Toggles the comment textarea.
  $('.reply-action').on('click', function(){
    $(this).parent().next('.new-reply-form').toggleClass('hidden');
  });

  $('.edit-action').on('click', function(e){
    e.preventDefault();
    clickedEdit = $(this)
    clickedActions = clickedEdit.parents('.actions-edit')
    clickedActions.toggleClass('hidden')
    clickedActions.siblings('.actions-save').toggleClass('hidden')
    appendLocation = clickedEdit.parents('.comment-row').children('.inner-comment-row')
    comment = clickedEdit.parents('.comment-row').children().find('.comment-body')
    text = comment.html().trim();
    comment.addClass('hidden')
    html = '<textarea class="form-control comments-input pull-left" name="comment[body]" id="comment_body">'+ text + '</textarea>'
    appendLocation.append(html)
    newTextArea = appendLocation.children('.comments-input')
    newTextArea.height(50)
  });

  $('.actions-save').on("click", function(e) {
    e.preventDefault();
    clickedSave = $(this)
    commentId = clickedSave.data('id')
    clickedSave.toggleClass('hidden')
    text = clickedSave.parents('.comment-row').children().find('textarea.comments-input.pull-left').val().trim();
    $.ajax({
      url: '/comments/' + commentId,
      method: 'patch',
      data: { comment: { body: text } },
      success: function(xhr) {
        location.reload()
      },
      error: function() {
        // I anything goes wrong, we might aswell reload the page to clear any errors
        location.reload()
      }
    })
  })

});
