var Cosmo = window.Cosmo;

Cosmo.Views.UserIndex = Backbone.CompositeView.extend({
  template: JST['users/index'],

  events: {
    "click .toggle": "toggleLike",
  },

  initialize: function (options) {
    this.listenTo(this.collection, 'add', this.addUserSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse);
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.each(function(user) {
      this.addUserSubview(user);
    }.bind(this));
  },

  toggleLike: function(event) {
    var id = +event.currentTarget.name;
    var otherUser = this.collection.get(id);
    if (otherUser.like().isNew()) {
      this.likeUser(otherUser);
    } else {
      this.unlikeUser(otherUser);
    }
  },

  likeUser: function(otherUser) {
    var attrs = {
      receiver_id: otherUser.id,
      sender_id: Cosmo.CURRENT_USER_ID
    };
    otherUser.like().save(attrs, {
      success: otherUser.render
    });
  },

  unlikeUser: function(otherUser) {
    otherUser.like().destroy({
      success: function() {
        otherUser.like().clear();
        otherUser.render();
      }
    });
  },

  addUserSubview: function (user) {
    user.isCurrentUser = ((+Cosmo.CURRENT_USER_ID) === (+user.id));
    var userIndexItem = new Cosmo.Views.UserIndexItem({
      collection: this.collection,
      model: user
    });
    this.addSubview('#user-index-results', userIndexItem);
  },

  render: function () {
    this.$el.html(this.template({
      title: this.collection.title,
      description: this.collection.description
    }));
    this.attachSubviews();
    return this;
  },

  removeUser: function(model) {
    this.removeModelSubview('.user-index', model);
  }

});
