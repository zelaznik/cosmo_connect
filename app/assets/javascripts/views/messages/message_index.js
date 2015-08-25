var Cosmo = window.Cosmo;

Cosmo.Views.MessageIndex = Backbone.CompositeView.extend({
  template: JST['messages/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'add', this.addMessageSubview);
    this.listenTo(this.collection, 'remove', this.removeMessage);
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.each(function(message) {
      this.addMessageSubview(message);
    }.bind(this));
  },

  render: function () {
    this.$el.html(this.template({
      title: this.collection.title,
      description: this.collection.description
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
