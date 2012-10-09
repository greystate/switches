
#### Views

# View for a `Switch`
class SwitchView extends Backbone.View
	initialize: ->
		# Let me know when my model's `state` attribute changes
		# and call my `stateChanged()` method when it does
		@model.on 'change:state', @stateChanged
		@model.on 'change:color', @colorChanged
	
	className: "switch"
	
	# Events in the View
	events:
		# Clicking the switch delegates the message to the model
		'click a': (event) ->
			event.preventDefault()
			@model.toggleState()

		# Pressing the 'c' key when a switch has focus, cycles the color
		# Pressing the spacebar toggles state
		'keypress a': (event) ->
			switch event.keyCode
				when 99 # c
					@model.cycleColor()
				when 32 # SPACE
					@model.toggleState()

	#### Rendering
	# The template
	template: _.template '''
		<a href="#">Switch <%= state %></a>
	'''
	# Render method
	render: ->
		@$el.html @template @model.toJSON()
		@$el.addClass @model.get 'state'
		@$el.addClass @model.get 'color'
		@

	# This is called when the Switch model changes state
	stateChanged: (theSwitch, state) =>
		@$el.removeClass(theSwitch.previous('state')).addClass(state)

	# This is called when the Switch model changes color
	colorChanged: (theSwitch, color) =>
		@$el.removeClass(theSwitch.previous('color')).addClass(color)

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
