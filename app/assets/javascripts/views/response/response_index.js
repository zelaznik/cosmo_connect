var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
  template: JST['essays/index'],

  events: {
    'change .response-index-wrapper': 'updateHeight'
  },

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addResponseSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'sync', this.render);

    //We only add the edit button if the response points to the current user.
    this.collection.each(this.addResponseSubview.bind(this));
  },

  addResponseSubview: function (response) {
    var responseIndexItem = new Cosmo.Views.ResponseIndexItem({
      collection: this.collection,
      user: this.model,
      model: response
    });
    this.addSubview('.response-index-wrapper', responseIndexItem);
  },

  updateHeight: function(event) {
    // Makes sure the two forms are of the same height
    $wrapper = $('.response-index-wrapper');
    $index = $('.response-index');
    $index.height($wrapper.height());
    $attrib = $('.user-attributes');
    if ($attrib) {
      $attrib.height($index.height());
    }
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    var wrappedHeight = $('.response-index-wrapper');
    return this;
  },

  removeResponse: function(model) {
    this.removeModelSubview('.response-index', model);
  }

});
