var Cosmo = window.Cosmo;

Cosmo.Views.MessageIndex = Backbone.CompositeView.extend({
  template: JST['messages/index'],

  initialize: function(options) {
    this.title = options.title;
    this.description = options.description;

    this.listenTo(this.collection, 'add', this.addMessageSubview);
    this.listenTo(this.collection, 'remove', this.removeMessage);
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.each(this.addMessageSubview.bind(this));
  },

  render: function () {
    this.$el.html(this.template({
      title: (this.collection.title || this.title),
      description: (this.collection.description || this.description)
    }));
    this.attachSubviews();
    return this;
  },

  addMessageSubview: function(message) {
    var messageIndexItem = new Cosmo.Views.MessageIndexItem({
      collection: this.collection,
      model: message
    });
    this.addSubview('#message-index-results', messageIndexItem);
  },

  removeMessage: function(model) {
    this.removeModelSubView('.message-index', model);
  }

});
