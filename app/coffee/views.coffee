class SwitchView extends Backbone.View
	initialize: ->
		# Let me know when my model's `state` attribute changes
		# and call my `stateChanged()` method when it does
		@model.on 'change:state', @stateChanged
	
	className: "switch"
	
	# Events in the View
	events:
		# Clicking the switch delegates the message to the model
		'click a': -> @model.toggleState()

	#### Rendering
	# The template
	template: _.template '''
		<a href="#">Switch <%= state %></a>
	'''
	# Render method
	render: ->
		@$el.html @template @model.toJSON()
		@$el.addClass @model.get 'state'
		@
	
	# This is called when the Switch model changes state
	stateChanged: (theSwitch, state) =>
		@$el.removeClass(theSwitch.previous('state')).addClass(state)

@app.SwitchView = SwitchView
