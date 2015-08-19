window.Cosmo.Views.ResponseIndexItemForm = Backbone.View.extend({
  template: JST['essays/form'],
  //model: Cosmo.Models.Response,

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
  },

  editEssay: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    this.model.save(obj.response, {
      success: function (responseIndexItem) {
        this.collection.add(responseIndexItem);
        this.remove();
      }.bind(this)
    });
  }
});