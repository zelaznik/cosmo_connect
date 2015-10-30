var Cosmo = window.Cosmo;

Cosmo.Views.UserDetails = Backbone.CompositeView.extend({
  template: JST['users/details'],

  render: function () {
    this.$el.html(this.template({
      user: this.model
    }));
    this.attachSubviews();
    return this;
  }

});
