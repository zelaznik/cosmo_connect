var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
  template: JST['essays/index'],

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addResponseSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'sync', this.render);

    //We only add the edit button if the response points to the current user.
    this.isCurrentUser = ((Cosmo.CURRENT_USER_ID*1) === this.model.id);
    this.collection.each(function(response) {
      this.addResponseSubview(response);
    }.bind(this));
  },

  addResponseSubview: function (response) {
    var responseIndexItem = new Cosmo.Views.ResponseIndexItem({
      isCurrentUser: this.isCurrentUser,
      collection: this.collection,
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
