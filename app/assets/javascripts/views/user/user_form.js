var Cosmo = window.Cosmo;

Cosmo.Views.UserForm = Backbone.View.extend({
  template: JST['users/show'],
  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    alert("UserForm#render");
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);

    return this;
  }

});
