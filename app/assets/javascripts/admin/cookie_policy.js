document.addEventListener("turbolinks:load", function() {
  // document.cookie = 'cookie-policy' + '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
  function setCookie(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
  }
  function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
  }
  if (getCookie("cookie-policy") == null ){
    $("#cookie-policy").removeClass('minimized');
  }
  $('#eat-cookie').on('click', function(){
    setCookie("cookie-policy", 1);
    $("#cookie-policy").addClass('minimized');
  })
});
