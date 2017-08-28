document.addEventListener("turbolinks:load", function() {
  $('.has-tooltip').tooltip();
  $('.toggle-expand').click(function() {
    $(document).find('.sidebar').toggleClass('not-expanded');
    $('.navbar-fixed-top.header').toggleClass('not-expanded');
    $('.toggle-expand').toggleClass('not-expanded');
    $('.current-user').toggleClass('not-expanded');
    $('.side-spacing').toggleClass('not-expanded');
  });

  // Loads the correct sidebar on window load,
  // collapses the sidebar on window resize.
  // Sets the min-height of #page-wrapper to window size
  $(function() {
    $(window).bind("load resize", function() {
      width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
      if (width < 768) {
        $(document).find('.sidebar').addClass('not-expanded');
        $('.navbar-fixed-top.header').addClass('not-expanded');
        $('.toggle-expand').addClass('not-expanded');
        $('.current-user').addClass('not-expanded');
        $('.side-spacing').addClass('not-expanded');
      }
      else {
        $(document).find('.sidebar').removeClass('not-expanded');
        $('.navbar-fixed-top.header').removeClass('not-expanded');
        $('.toggle-expand').removeClass('not-expanded');
        $('.current-user').removeClass('not-expanded'); 
        $('.side-spacing').removeClass('not-expanded');
      }
    });
  }); 
});
