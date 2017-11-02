document.addEventListener("turbolinks:load", function() {
  function formatArticles (article) {
    if (article.text.split("//")[1] != undefined) {
      var $article = $(
        '<div class="row"><div class="col-md-3">' + article.text.split("//")[0] + '</div><div class="col-md-3">' + article.text.split("//")[1] + '</div></div>'
      );
    }
    return $article;
  };
  // creates a select2 for hightlight's articles
  $( ".articles-list" ).select2({
    theme: "bootstrap",
    templateResult: formatArticles
  });

  $( ".positions-list" ).select2({
    theme: "bootstrap"
  });
});
