window.Cosmo.Views.ResponseIndexItemForm = Backbone.View.extend({
  template: JST['essays/form'],
  model: Cosmo.Models.Response,

  events: {
    'keyup': 'handleKey',
    'submit form': 'editEssay',
    'click .close': 'removeBtn',
    'click .m-background': 'removeBtn'
  },

  initialize: function () {
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
    this.$el.html(this.template({}));
    return this;
  },

  editEssay: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    var formData = obj.ResponseIndexItem;
    this.model.save(formData, {
      success: function (responseIndexItem) {
        this.collection.add(responseIndexItem);
        this.remove();
      }.bind(this)
    });
  }
});
