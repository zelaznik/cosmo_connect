var Cosmo = window.Cosmo;

Cosmo.Views.UserShow = Backbone.CompositeView.extend({
  template_preview: JST['users/preview'],
  template: JST['users/show'],
  model: Cosmo.Models.User,

  events: {
    "click .upload-photo": "upload",
    "click .toggle": "toggleLike",
    "change #gender": "updateGender",
    "change #desired-genders": "updateGenderPreferences",
    "submit #birthdate": "updateBirthdate",
    "click #send-message": 'sendMessage'
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

  sendMessage: function (event) {
    event.preventDefault();
    var modal = new Cosmo.Views.NewMessageForm({
      other_user: this.model
    });
    $('#content').append(modal.render().$el);
  },

  updateGender: function(event) {
    this._updateAttribute(event, 'gender_id');
  },

  updateGenderPreferences: function(event) {
    var $target = $(event.currentTarget);
  },

  updateBirthdate: function(event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    var d = $target.serializeJSON();
    var attrs = {birthdate: {year: d.year, month: d.month, day: d.day}};
    this.model.save(attrs, {});
  },

  _updateAttribute: function (event, key) {
    var $target = $(event.currentTarget);
    var attrs = {};
    attrs[key] = +$target.val();
    this.model.save(attrs, {});
  },

  toggleLike: function(event) {
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
    //Attach the essay questions and other attributes
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);

    //Attach the user preview template
    var preview = this.template_preview({
      useLink: false,
      user: this.model
    });
    this.$('.user-preview').html(preview);

    this.attachSubviews();

    return this;
  }

});
