var Cosmo = window.Cosmo;

Cosmo.Views.UserIndexItem = Backbone.View.extend({
  template: JST['users/preview'],
  className: 'row user-index-item',

  events: {
    "click .toggle": "toggleLike",
  },

  initialize: function(options) {
  },

  toggleLike: function(event) {
    var id = +event.currentTarget.name;
    otherUser = this.model;
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
      success: this.render.bind(this)
    });
  },

  unlikeUser: function(otherUser) {
    otherUser.like().destroy({
      success: function() {
        otherUser.like().clear();
        this.render();
      }.bind(this)
    });
  },

  render: function() {
    var content = this.template({
      useLink: true,
      user: this.model
    });
    this.$el.html(content);
    return this;
  }


});
