document.addEventListener("turbolinks:load", function() {
  // Reloads images after page is loaded to provide the best resolution
  $('.reload-image').each(function() {
    // Generates the image url
    path = '/uploads/article/image/' + $(this).data('id') + '/'
    // Gets the image name
    filename = $(this).data('image-name')
    // Finds the resolution and matches with an image size
    if ($(this).width() < 200) {
      // Nothing to do here, this is the default size
    } else if ($(this).width() < 400) {
      bg_url = "url(" + path + "small_" + filename +")"
      $(this).css("background-image", bg_url)
    } else if ($(this).width() < 800) {
      bg_url = "url(" + path + "medium_" + filename +")"
      $(this).css("background-image", bg_url)
    } else if ($(this).width() < 1200) {
      bg_url = "url(" + path + "large_" + filename +")"
      $(this).css("background-image", bg_url)
    } else {
      bg_url = "url(" + path + filename +")"
      $(this).css("background-image", bg_url)
    }
  });
});
