var Cosmo = window.Cosmo;

Cosmo.Views.MessageIndexItem = Backbone.View.extend({
  template: JST['messages/preview'],
  className: 'row message-index-item',

  render: function () {
    var content = this.template({
      message: this.model
    });
    this.$el.html(content);
    return this;
  }

});
