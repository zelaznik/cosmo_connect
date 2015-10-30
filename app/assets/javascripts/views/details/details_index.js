var Cosmo = window.Cosmo;

Cosmo.Views.DetailsIndex = Backbone.CompositeView.extend({
  template: JST['details/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'add', this.addDetailsSubview);
    this.listenTo(this.collection, 'remove', this.removeDetailsSubview);
    this.listenTo(this.collection, 'sync', this.render);
  },

  lookup: {
    'birthdate': {'title': 'Date Of Birth'}
  },

  addDetailsSubview: function(detail) {
    var messageIndexItem = new Cosmo.Views.DetailsIndexItem({
      collection: this.collection,
      model: detail
    });
    this.addSubview('#message-index-results', messageIndexItem);
  },

  removeDetailsSubview: function(model) {
    this.removeModelSubView('.message-index', model);
  },

  render: function () {
    this.$el.html(this.template({
      details: this.model.details,
      user: this.model
    }));
    this.attachSubviews();
    return this;
  }

});
