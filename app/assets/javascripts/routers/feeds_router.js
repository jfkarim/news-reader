NewsReader.Routers.Feeds = Backbone.Router.extend({
	initialize: function(options) {
		this.$rootEl = options.$rootEl;
		this.feedsRendered = false;
		this.postsRendered = false;
	},
	
	routes: {
		"": "index"
	}

	index: function() {
		var that = this;
		
		var indexView = new NewsReader.Views.FeedsIndexView({
			collection: NewsReader.feeds
		});
		
		$(".feeds").html(indexView.render().el);
		
		this.feedsRendered = true
	}
});
