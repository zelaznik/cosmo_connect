var Cosmo = window.Cosmo;

Cosmo.Views.AboutShow = Backbone.View.extend({
  template: JST['about/show'],
  render: function () {
    this.$el.html(this.template());
    return this;
  }
});
