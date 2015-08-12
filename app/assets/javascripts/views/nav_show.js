Cosmo.Views.HavShow = Backbone.View.extend({
  template: JST['nav'],

  initialize: function (options) {
    this.router = options.router;
    this.listenTo(this.router, 'route', this.handleRoute);
  },

  handleRoute: function (routeName, params) {
    this.$el.find('.active').removeClass('active');
    this.$el.find('.' + routeName).addClass();
  },

  render: function() {
    var content = this.template({
      // Not passing any information to it.
    });
    this.$el.html(content);

    return this;
  }

});
