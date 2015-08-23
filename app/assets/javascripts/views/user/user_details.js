var Cosmo = window.Cosmo;

Cosmo.Views.UserDetails = Backbone.CompositeView.extend({
  template: JST['user/details'],

  render: function () {
    throw "User Details being called here.";
    var content = this.template({});
    this.$el.html(content.render().$el);

    return this;
  }
});
