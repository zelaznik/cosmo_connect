var Cosmo = window.Cosmo;

Cosmo.Views.UserIndex = Backbone.CompositeView.extend({
  template: JST['users/index'],
  initialize: function () {
    this.listenTo(this.collection, 'add', this.addUserSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse);
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.each(function(user) {
      this.addUsersubview(user);
    }.bind(this));
  },

  addUserSubview: function (user) {
    user.isCurrentUser = ((+Cosmo.CURRENT_USER_ID) === (+user.id));
    var userIndexItem = new Cosmo.Views.UserIndexItem({
      collection: this.collection,
      model: user
    });
    this.addSubview('.user-index-wrapper', userIndexItem);
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  removeUser: function(model) {
    this.removeModelSubview('.user-index', model);
  }

});
