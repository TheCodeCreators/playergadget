document.addEventListener("turbolinks:load", function() {
  // Deals with the infinite scroll.
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 150) {
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});
