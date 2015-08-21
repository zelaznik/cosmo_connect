window.Cosmo.Views.ResponseIndexItemForm = Backbone.ModalView.extend({
  template: JST['essays/form'],

  submit: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    this.model.save(obj.response, {
      success: function (responseIndexItem) {
        this.collection.add(responseIndexItem);
        this.remove();
      }.bind(this)
    });
  },

  render: function () {
    this.$el.html(this.template({
      isCurrentUser: this.isCurrentUser,
      response: this.model
    }));
    return this;
  }

});
