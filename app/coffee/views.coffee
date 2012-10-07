
#### Views

# View for a `Switch`
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

# View for the `SwitchBoard` collection
class SwitchBoardView extends Backbone.View
	initialize: ->
		@collection.on 'add', @render, @
	
	className: "switchboard"
	
	render: ->
		# Clear the contents before building the view
		@$el.html ''
		@collection.each (swatch) =>
			@$el.append new SwitchView(model: swatch).render().el
		@


@app.SwitchView = SwitchView
@app.SwitchBoardView = SwitchBoardView
