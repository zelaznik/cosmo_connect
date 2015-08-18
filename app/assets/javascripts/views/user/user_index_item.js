var Cosmo = window.Cosmo;

Cosmo.Views.UserIndexItem = Backbone.View.extend({
  template: JST['users/show'],
  className: 'user-index-item',
  initialize: function(options) {
  },
  render: function() {
    var content = this.template({

    });
    this.$el.html(content);
    return this;
  }
});
