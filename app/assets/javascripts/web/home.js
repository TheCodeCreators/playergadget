document.addEventListener("turbolinks:load", function() {
  if ($('.with-infinite-scroll').length) {
    // Deals with the infinite scroll.
    if ($('.pagination').length) {
      $(window).scroll(function() {
        var url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 250) {
          $('.pagination').text("Please Wait...");
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }
  }
});
