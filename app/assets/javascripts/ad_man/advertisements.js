// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var MAX_FILE_SIZE = 5242880; // 5MB
var ACCEPT_FILE_TYPE = /image\/(jpg|jpeg|png|gif|bmp)/i;

function handleFileSelect(evt) {
  var files = evt.target.files; // FileList object
  var form = $(evt.target).closest('form');

  // Loop through the FileList and render image files as thumbnails.
  for (var i = 0, f; f = files[i]; i++) {
    // Only process image files.
    if (!f.type.match(ACCEPT_FILE_TYPE)) {
      showFormError('File is not an image', form);
      continue;
    }

    if (parseInt(f.size) > MAX_FILE_SIZE) {
      showFormError('File size exceeds 5MB.', form);
      continue;
    }

    var reader = new FileReader();
    // Closure to capture the file information.
    reader.onload = (function(theFile) {
      return function(e) {
        // Render thumbnail.
        var img = ['<img src="', e.target.result,
                          '" title="', theFile.name, '"/>'].join('');
        form.find('.preview').html(img);
        form.find('.preview').show();
      };
    })(f);

    // Read in the image file as a data URL.
    reader.readAsDataURL(f);
  }
}

function showFormError(msg, form) {
  var errorDiv = document.createElement('div');
  errorDiv.className = 'errors';
  errorDiv.innerHTML = msg;
  form.find('div.errors').remove();
  form.prepend(errorDiv);
}
AdMan = {
	//function showAd(key) {
	showAd: function(key, size) {
		$.ajax({
			url: "/ad_man/advertisements/get_ad/" + key + "/" + size,
			dataType: "script", 
			success: function(data){}
		});
	}
}
