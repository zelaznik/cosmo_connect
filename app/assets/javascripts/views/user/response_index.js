var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
  template: JST['essays/index'],

  render: function() {
    var content = this.template({});
    this.$el.html(content);

    return this;
  },

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addSubView);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'add remove', this.render);
  },

  removeResponse: function(model) {
    this.removeModelSubView('choose your own selector name here', model);
  }

});