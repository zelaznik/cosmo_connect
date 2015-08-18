var Cosmo = window.Cosmo;

Cosmo.Views.UserIndexItem = Backbone.View.extend({
  template: JST['users/preview'],
  className: 'row user-index-item',
  initialize: function(options) {
  },
  render: function() {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  }
});
