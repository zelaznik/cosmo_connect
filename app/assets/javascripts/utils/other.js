function handleKeys(event) {
  if (event.keyCode === 27) {
    this.cancel(event); // Handle {ESCAPE}
  }
}

function handleClick(event) {
  if ($(this).has(event.target).length === 0) {
    this.cancel(event);
  }
}

String.prototype.capitalized = function() {
  var words = this.split(' ');
  for (var i in words) {
    var w = words[i];
    words[i] = w[0].toUpperCase() + w.slice(1, w.length).toLowerCase();
  }
  return words.join(' ');
};

function find_by(array, key, value) {
  for (var i in array) {
    if (array[i][key] === value) {
      return array[i];
    }
  }
}
