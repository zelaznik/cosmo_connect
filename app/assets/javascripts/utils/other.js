var Cosmo = window.Cosmo;

function cancelOnEscape(event) {
  if (event.keyCode === 27) {
    this.cancel(event); // Handle {ESCAPE}
  }
}

function cancelOnClick(event) {
  this.cancel(event);
}

String.prototype.capitalized = function() {
  var words = this.split(' ');
  for (var i in words) {
    var w = words[i];
    words[i] = w[0].toUpperCase() + w.slice(1, w.length).toLowerCase();
  }
  return words.join(' ');
};

function snakeToCapitalized(orig) {
  return orig.replace('_',' ').capitalized();
}

function find_by(array, key, value) {
  for (var i in array) {
    if (array[i][key] === value) {
      return array[i];
    }
  }
}

function CloudinaryPath(options) {
  // Parses a Cloudinary base URL path
  this.origUrl = options.url;

  var parts = url.toLowerCase().split('/');
  var i = parts.indexOf('upload') + 1;

  this.photoId = parts[i];
  this.baseUrl = parts.slice(0, i).join('/');

  var name = parts[i+1].split('.');
  this.photoName = name.slice(0, name.length - 1).join('.');
  this.photoExt = options.ext || name[name.length - 1];
}

CloudinaryPath.prototype.fullPath = function(options) {
  var ext = options.ext || this.photoExt;
  return [this.baseUrl, options.processing, this.photoId, this.photoName].join('/') + '.' + ext;
};

CloudinaryPath.prototype.thumbnail = function(options) {
  var processing = ['c_limit'];
  processing.push('w_' + options.width);
  processing.push('h_' + options.height);
  return this.fullPath({processing: processing});
};
