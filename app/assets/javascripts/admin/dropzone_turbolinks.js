// initializes function ready to use it later with turbolinks
var ready;
ready = function() {
  // sets autoDiscover to false
  Dropzone.autoDiscover = false;
  // creates expense dropzone object
  $("#myDrop").dropzone({
    acceptedFiles: '.jpg, .jpeg, .gif, .png, .pdf, .txt, .log',
    autoProcessQueue: false,
    addRemoveLinks: true,
    paramName: "image[file]",
    maxFiles: 1, 
    clickable:'#dropzoneClickableArea',
    previewsContainer: '#dropzonePreview',
    uploadMultiple: false,

    // The setting up of the dropzone
    init: function() {
      var myDropzone = this;

      // submits your form to the specified action path
      $('input[type="submit"]').on("click", function (e) {
        // Make sure that the form isn't actually being sent.
        if (myDropzone.getQueuedFiles().length > 0) {
          e.preventDefault();
          e.stopPropagation();
          myDropzone.processQueue();
        }
      });

      // gets triggered when the files have successfully been sent.
      // redirects user to expenses index
      this.on("success", function(file) {
        window.location.href = "/admin/images"
      });
      this.on("error", function (file, errorMessage, xhr) {
        console.log('error');
        // appends a list with the form errors if any
        $('.ticket-form-errors').append(errorMessages(errorMessage));
      });
    }
  });
  // removes drag&drop text on click or file drop
  $('#dropzonePreview').bind('DOMNodeInserted DOMNodeRemoved', function() {
    $('.inside-uploader').addClass('hidden');
  });
  // returns a list with the form errors
  errorMessages = function(errorMessage) {
    var errors_html = "";
    for (var i = 0; i < Object.keys(errorMessage).length; i++) {
      errors_html += ( "<li>" + Object.keys(errorMessage)[i] + " " + errorMessage[Object.keys(errorMessage)[i]] + "</li><br>");
    }
    awesomeDiv = "<p>Error(s) have prevented this model from being saved :</p> <ul id='error_explanation'>" + errors_html + "</ul>";
    return awesomeDiv;
  };
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:load', ready);