var Cosmo = window.Cosmo;

Cosmo.Views.DesiredGenders = Backbone.View.extend({
  template: JST['essays/index'],

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addResponseSubview);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'sync', this.render);

    //We only add the edit button if the response points to the current user.
    this.collection.each(this.addResponseSubview.bind(this));
  }

});
