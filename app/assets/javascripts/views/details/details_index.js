var Cosmo = window.Cosmo;

Cosmo.Views.DetailsIndex = Backbone.CompositeView.extend({
  template: JST['details/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'add', this.addDetailsSubview);
    this.listenTo(this.collection, 'remove', this.removeDetailsSubview);
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.each(this.addDetailsSubview.bind(this));
  },

  addDetailsSubview: function(detail) {
    var detailsItemView = new Cosmo.Views.DetailsIndexItem({
      collection: this.collection,
      user: this.model,
      model: detail
    });
    this.addSubview('#details-index-results', detailsItemView);
  },

  removeDetailsSubview: function(model) {
    this.removeModelSubView('.message-index', model);
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  }

});
