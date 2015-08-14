var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
	initialize: function () {
		this.listenTo(this.collection, 'add', this.addSubView);
		this.listenTo(this.collection, 'remove', this.removeResponse);
		this.listenTo(this.collection, 'add remove', this.render);
	},

	removeResponse: function(model) {
		this.removeModelSubView('choose your own selector name here', model);
	}

	

});