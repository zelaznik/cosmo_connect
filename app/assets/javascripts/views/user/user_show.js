var Cosmo = window.Cosmo;

Cosmo.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/show'],
  model: Cosmo.Models.User,

  events: {
    "click .upload-photo": "upload",
    "click .toggle": "toggleLike",
    "change #gender": "updateGender"
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.responses(), 'sync', this.render);
    var responseIndexView = new Cosmo.Views.ResponseIndex({
      collection: this.model.responses(),
      model: this.model
    });

    this.addSubview('.response-index', responseIndexView);
  },

  updateGender: function (event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    debugger;
  },

  toggleLike: function(event) {
    if (this.model.isCurrentUser) {
      throw "Cannot like one's own photo.";
    }

    if (this.model.like().isNew()) {
      this.likeUser();
    } else {
      this.unlikeUser();
    }
  },

  likeUser: function() {
    var attrs = {
      receiver_id: this.model.id,
      sender_id: Cosmo.CURRENT_USER_ID
    };
    this.model.like().save(attrs, {
      success: this.render.bind(this)
    });
  },

  unlikeUser: function() {
    this.model.like().destroy({
      success: function() {
        this.model.like().clear();
        this.render();
      }.bind(this)
    });
  },

  upload: function(e) {
    var photo = this.model.photo();
    e.preventDefault();
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      var data = result[0];
      photo.set({url: data.url, thumb_url: data.thumbnail_url});
      photo.save({}, {
        success: function() {
          this.render();
        }.bind(this)
      });
    });
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
