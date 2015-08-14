var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/show'],
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = template({
      essay: this.model
    });
    this.$el.html(content);
    return this;
  }
});
