var Cosmo = window.Cosmo;

Cosmo.Views.UserPreview = Backbone.View.extend({
  template: JST['users/preview'],

  initialize: function(options) {
    this.useLink = options.useLink;
    this.listenTo(this.model, 'sync set save', this.render);
    this.listenTo(this.model.details(), 'sync', this.render);
    this.listenTo(this.model.like(), 'sync set clear destroy', this.render);
  },

  render: function() {
    var content = this.template({
      useLink: this.useLink,
      user: this.model
    });
    this.$el.html(content);

    return this;
  }

});
