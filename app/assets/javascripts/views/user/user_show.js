var Cosmo = window.Cosmo;

Cosmo.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/show'],
  model: Cosmo.Models.User,

  events: {
    "click .upload-photo": "upload",
    "click .toggle": "switchLike"
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

  switchLike: function(e) {
    e.preventDefault();
    alert("Hello, world!");
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
