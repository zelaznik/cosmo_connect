var Cosmo = window.Cosmo;

Cosmo.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/show'],
  model: Cosmo.Models.User,

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.responses(), 'sync', this.render);
    var responseIndexView = new Cosmo.Views.ResponseIndex({
      collection: this.model.responses()
    });

    this.addSubview('.response-index', responseIndexView);
  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    this.attachSubviews();

    return this;
  }

});
