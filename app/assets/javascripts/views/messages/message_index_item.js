var Cosmo = window.Cosmo;

Cosmo.Views.MessageIndexItem = Backbone.View.extend({
  template: JST['messages/preview'],
  className: 'row message-index-item',

  initialize: function(options) {

  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  }

});
