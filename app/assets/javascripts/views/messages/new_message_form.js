var Cosmo = window.Cosmo;

Cosmo.Views.NewMessageForm = Backbone.ModalView.extend({
  template: JST['messages/form'],

  initialize: function(options) {
    this.other_user = options.other_user;
  },

  submit: function(event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    var message = new Cosmo.Models.Message({});
    message.save(obj.message, {
      success: function (responseIndexItem) {
        this.remove();
      }.bind(this)
    });
  },

  render: function () {
    this.$el.html(this.template({
      other_user: this.other_user
    }));
    return this;
  }

});
