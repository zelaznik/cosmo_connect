var Cosmo = window.Cosmo;

Cosmo.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/show'],
  model: Cosmo.Models.User,

  events: {
    "click .upload-photo": "upload",
    "click .toggle": "toggleLike",
    "change #gender": "updateGender",
    "change #desired-genders": "updateGenderPreferences",
    "submit #birthdate": "updateBirthdate",
    "submit #new-message": 'sendMessage',
    "click #cancel-message": 'cancelMessage'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync set save', this.render);
    this.listenTo(this.model.messages(), 'sync', this.render);
    this.listenTo(this.model.responses(), 'sync', this.render);
    this.listenTo(this.model.details(), 'sync', this.render);

    var responseIndexView = new Cosmo.Views.ResponseIndex({
      collection: this.model.responses(),
      model: this.model
    });
    this.addSubview('.response-index', responseIndexView);

    // Attach the user preview template
    var userPreview = new Cosmo.Views.UserPreview({
      model: this.model,
      useLink: false
    });
    this._preview = userPreview;
    this.addSubview('.user-preview', userPreview);

    var userDetailsView = new Cosmo.Views.DetailsIndex({
      collection: this.model.details(),
      userPreview: userPreview,
      model: this.model
    });
    this.addSubview('.user-attributes', userDetailsView);


    if (Cosmo.NEW_USER) {
      var userModalView = new Cosmo.Views.NewUserModal({
        user: this.model
      });
      this.addSubview('.user-info-modal', userModalView);
      Cosmo.NEW_USER = false;
    }
  },

  cancelMessage: function(event) {
    event.preventDefault();
    $('#new-message textarea').val('');
  },

  sendMessage: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    var message = new Cosmo.Models.Message(obj);
    message.save(obj.message, {
      success: function (responseIndexItem) {
        var complete = new Cosmo.Models.Message(responseIndexItem.attributes);
        this.model.messages().add(complete);
        var receiver_id = complete.get('receiver_id');
        Cosmo.router.messageHistory(receiver_id);
      }.bind(this)
    });
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
    this.model.like().save(attrs, {});
    this._preview.render();
  },

  unlikeUser: function() {
    this.model.like().destroy({
      success: function() {
          this.model.like().clear();
          this._preview.render();
      }.bind(this)
    });

    this._preview.render();
  },

  upload: function(e) {
    var userShowView = this;
    e.preventDefault();
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      var data = result[0];
      var photo = new Cosmo.Models.Photo({
        user: userShowView.model
      });

      photo.set({url: data.secure_url, thumb_url: data.thumbnail_url});
      photo.save({}, {
        success: function() {
          window.location.replace('/');
        }.bind(this),
        error: function() {
        }.bind(this)
      });
    });
  },

  render: function () {
    // Attach the essay questions and other attributes
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);

    // Attach the message history
    var view = new Cosmo.Views.MessageIndex({
      collection: this.model.messages()
    });
    this.$('#message-index-results').html(view);

    this.attachSubviews();
    return this;
  }

});
