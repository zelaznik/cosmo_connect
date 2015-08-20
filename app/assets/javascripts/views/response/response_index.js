var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
  template: JST['essays/index'],

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addResponseSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'sync', this.render);

    //We only add the edit button if the response points to the current user.
    this.collection.each(this.addResponseSubview.bind(this));
  },

  addResponseSubview: function (response) {
    var responseIndexItem = new Cosmo.Views.ResponseIndexItem({
      collection: this.collection,
      user: this.model,
      model: response
    });
    this.addSubview('.response-index-wrapper', responseIndexItem);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  removeResponse: function(model) {
    this.removeModelSubview('.response-index', model);
  }

});
