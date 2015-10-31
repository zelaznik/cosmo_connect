var Cosmo = window.Cosmo;

Cosmo.Views.DetailsIndexItem = Backbone.View.extend({
  tagName: 'tr',

  _errorTemplate: JST['details/index_item_error'],

  _templates: {
    'birthdate': JST['details/index_item_birthdate'],
    'age': JST['details/index_item_age'],
    'gender': JST['details/index_item_gender'],
    'interested_in': JST['details/index_item_interested_in'],
    'ages': JST['details/index_item_ages'],
    'religion': JST['details/index_item_religion'],
    'relationship_status': JST['details/index_item_gender'],
    'height': JST['details/index_item_height'],
    'body_type': JST['details/index_item_body_type'],
    'ethnicity': JST['details/index_item_ethnicity']
  },

  template: function(category, options) {
    var template = this._templates[category];
    try {
      return template(options);
    }
    catch (error) {
      options.category = options.category || '(No Category/ID Specified)';
      options.error = error;
      return this._errorTemplate(options);
    }
  },

  events: {
    'change input[type=radio]': 'radioChange',
    'dblclick .details-item-value': 'updateDetails',
    'change input[type=checkbox]': 'checkboxChange',
    'click .user-details-edit-icon': 'updateDetails',
    'submit #details-form': 'submit',
    'click .details-cancel': 'cancel',
    'change select': 'submit'
  },

  model: Cosmo.Models.Detail,

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  checkboxChange: function(event) {
    var $t = $(event.target);
    var wasChecked = $t.attr('checked');
    var checkedNow = !wasChecked;
    $t.attr('checked', checkedNow);

    var data = {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
      'key': $t.prop('value'),
      'value': checkedNow
    };

    $.ajax({
      url: this.model.urlRoot + '/' + $t.prop('name'),
      dataType: 'json',
      type: 'PATCH',
      data: data,
      success: function(data) {
        this.user.set(data);
      }.bind(this),

      error: function() {
      }
    });
  },

  radioChange: function(event) {
    event.preventDefault();
    var $t = event.target;
    var data = {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
      'value': $t.value
    };
    $.attr('selected', true);

    $.ajax({
      url: this.model.urlRoot + '/' + $t.name,
      dataType: 'json',
      type: 'PATCH',
      data: data,
      success: function(data) {
        this.user.set(data);
      }.bind(this),

      error: function() {
        console.log(arguments[0]);
      }
    });
  },

  submit: function(event) {
    event.preventDefault();
    $t = $(event.currentTarget);
    var data = {
      'id': $t.attr('name'),
      'value': $t.serializeJSON()
    };

    this.model.save(data, {
      success: function(detailsIndexItem) {
        this.collection.add(detailsIndexItem);
        this.remove();
        this.render(false);
      }.bind(this)
    });
    this.render(false);
  },

  updateDetails: function(event) {
    event.preventDefault();
    if (!this.editMode) {
      this.render(true);
    }
  },

  cancel: function(event) {
    event.preventDefault();
    this.render(false);
  },

  render: function(editMode) {
    this.editMode = editMode;
    if (editMode) {
      $(document).on('keyup', handleKeys.bind(this));
    } else {
      $(document).unbind('keyup', handleKeys);
    }

    var content = this.template(
      this.model.get('id'), {
        category: this.model.get('id'),
        id: this.model.get('id'),
        value: this.model.get('value'),
        user: this.user,
        editMode: !!this.editMode
      }
    );
    this.$el.html(content);
    return this;
  }

});