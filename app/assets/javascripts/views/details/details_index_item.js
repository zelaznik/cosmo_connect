var Cosmo = window.Cosmo;

Cosmo.Views.DetailsIndexItem = Backbone.View.extend({
  template: {
    'birthdate': JST['details/index_item_birthdate'],
    'gender': JST['details/index_item_gender'],
    'intereste_in': JST['details/index_item_intereste_in'],
    'ages': JST['details/index_item_ages'],
    'religion': JST['details/index_item_religion'],
    'relationship_status': JST['details/index_item_gender'],
    'height': JST['details/index_item_height'],
    'body_type': JST['details/index_item_body_type'],
    'ethnicity': JST['details/index_item_ethnicity']
  },

  events: {
    'dblclick .details-item-value': 'updateDetails'
  },

  className: 'user-details-index-item',
  model: Cosmo.Models.Detail,

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  updateDetails: function(event) {
    this.render(true);
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
