class SwitchView extends Backbone.View
	className: "switch"
	
	template: _.template '''
		<a href="#">Switch <%= state %></a>
	'''

	render: ->
		@$el.html @template @model.toJSON()
		@

@app.SwitchView = SwitchView
