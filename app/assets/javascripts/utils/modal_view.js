Backbone.ModalView = Backbone.View.extend({
  events: {
    'keyup': 'handleKey',
    'submit form': 'submit',
    'click .close': 'removeBtn',
    'click .modal-background': 'removeBtn'
  },

  initialize: function (options) {
    $(document).on('keyup', this.handleKey.bind(this));
  },

  remove: function() {
    $(document).off('keyup', this.handleKey.bind(this));
    Backbone.View.prototype.remove.call(this);
  },

  submit: function(event) {
    throw "The function 'submit' needs to be overridden in a ModalView subclass.";
  },

  handleKey: function(event) {
    if (event.keyCode === 27) {
      this.remove();
    }
  },

  removeBtn: function(event) {
    event.preventDefault();
    this.remove();
  }

});
