var Cosmo = window.Cosmo;

Cosmo.Views.DetailsIndexItem = Backbone.View.extend({
  tagName: 'tr',

  template: {
    'birthdate': JST['details/index_item_birthdate'],
    'gender': JST['details/index_item_gender'],
    'interested_in': JST['details/index_item_interested_in'],
    'ages': JST['details/index_item_ages'],
    'religion': JST['details/index_item_religion'],
    'relationship_status': JST['details/index_item_gender'],
    'height': JST['details/index_item_height'],
    'body_type': JST['details/index_item_body_type'],
    'ethnicity': JST['details/index_item_ethnicity']
  },

  events: {
    'change input[type=radio]': 'radioChange',
    'dblclick .details-item-value': 'updateDetails',
    'change input[type=checkbox]': 'checkboxChange'
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
        //this.render();
      }.bind(this),

      error: function() {
      }
    });
  },

  radioChange: function(event) {
    var $t = event.target;
    var data = {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
      'value': $t.value
    };

    $.ajax({
      url: this.model.urlRoot + '/' + $t.name,
      dataType: 'json',
      type: 'PATCH',
      data: data,
      success: function(data) {
        this.user.set(data);
        this.render();
      }.bind(this),

      error: function() {
      }
    });
  },

  submit: function(event) {
    throw "The function 'submit' needs to be overridden in a ModalView subclass.";
  },

  handleKey: function(event) {
    if (event.keyCode === 27) {
      this.remove();
    }
  },

  handleClick: function(event) {

  },

  updateDetails: function(event) {
    this.render(true);
    $(document).on('keyup', this.handleKey.bind(this));
    $(document).on('click', this.handleClick.bind(this));
  },

  remove: function() {
    $(document).off('keyup', this.handleKey.bind(this));
    $(document).off('click', this.handleClick.bind(this));
    //Backbone.View.prototype.remove.call(this);
    this.render(false);
  },

  render: function(editMode) {
    var template = this.template[this.model.get('category')];
    this.$el.html(template({
      value: this.model.get('value'),
      user: this.user,
      editMode: !!editMode
    }));
    return this;
  }

});
