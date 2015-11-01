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
    'religion': JST['details/index_item_select_tag'],
    'relationship_status': JST['details/index_item_select_tag'],
    'height': JST['details/index_item_height'],
    'body_type': JST['details/index_item_select_tag'],
    'ethnicity': JST['details/index_item_select_tag']
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
    'change select': 'submitSelect'
  },

  model: Cosmo.Models.Detail,

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
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

  submitSelect: function(event) {
    event.preventDefault();
    $sel = $(':selected');

    // Update the backbone models so nothing else is selected.
    var selected_id = +$sel.attr('value');
    var items = this.model.attributes.value;
    for (var i in items) {
      items[i].selected = (items[i].id === selected_id);
    }

    this.model.save({}, {
      success: function(selectionItem) {
        this.collection.add(selectionItem);
        this.remove();
        this.render(false);
      }.bind(this)
    });

    this.render(false);
  },

  radioChange: function(event) {
    // Use jquery to select the button
    event.preventDefault();
    var $t = $(event.target);
    $.attr('selected', true);

    // Update the backbone models so nothing else is selected.
    var selected_id = +$t.attr('value');
    var items = this.model.attributes.value;
    for (var i in items) {
      items[i].selected = (items[i].id === selected_id);
    }

    this.model.save({}, {
      success: function() {},
      error: function() {}
    });
  },

  checkboxChange: function(event) {
    event.preventDefault();
    var $t = $(event.target);
    var wasChecked = !!$t.attr('checked');
    var checkedNow = !wasChecked;
    $t.attr('checked', checkedNow);

    // Update the backbone models so nothing else is selected.
    var clicked_id = +$t.attr('value');
    var items = this.model.attributes.value;
    for (var i in items) {
      var item = items[i];
      if (item.id == clicked_id) {
        item.selected = checkedNow;
        break;
      }
    }

    this.model.save({}, {
      success: function(indexItem) {
      }
    });
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
    var cssName = ':not(.details-item-value .' + this.model.get('id') + ')';
    if (editMode) {
      $(document).on('keyup', handleKeys.bind(this));
      $(cssName).click(function(event) {

      }.bind(this));
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
