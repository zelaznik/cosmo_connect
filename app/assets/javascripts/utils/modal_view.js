Backbone.ModalView = Backbone.View.extend({
  events: {
    'keyup': 'handleKey',
    'submit form': 'editEssay',
    'click .close': 'removeBtn',
    'click .m-background': 'removeBtn'
  },

  initialize: function (options) {
    $(document).on('keyup', this.handleKey.bind(this));
  },

  handleKey: function(event) {
    if (event.keyCode === 27) {
      this.remove();
    }
  },

  removeBtn: function(event) {
    event.preventDefault();
    this.remove();
  },

  render: function () {
    this.$el.html(this.template({
      isCurrentUser: this.isCurrentUser,
      response: this.model
    }));
    return this;
  }

});
