Cosmo.Views.UserForm = Backbone.View.extend({
  template: JST['users/show'],
  render: function () {
    var content = this.template({

    });
    this.$el.html(content);

    return this;
  }

});
