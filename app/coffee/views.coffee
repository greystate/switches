class SwitchView extends Backbone.View
	initialize: ->
		@model.on 'change:state', @stateChanged
	
	className: "switch"
	
	template: _.template '''
		<a href="#">Switch <%= state %></a>
	'''

	# Events in the View
	events:
		# Clicking the switch delegates the message to the model
		'click a': -> @model.toggleState()

	render: ->
		@$el.html @template @model.toJSON()
		@$el.addClass @model.get 'state'
		@
	
	stateChanged: (theSwitch, state) =>
		@$el.removeClass(theSwitch.previous('state')).addClass(state)

@app.SwitchView = SwitchView
