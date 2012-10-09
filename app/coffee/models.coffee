class Switch extends Backbone.Model
	@COLORS = [ "red", "green", "orange" ]
	
	defaults:
		color: @COLORS[0]
		state: 'on'
	
	isOn: -> @get('state') is 'on'
	isOff: -> @get('state') is 'off'
	
	toggleState: -> @set 'state', if @isOn() then 'off' else 'on'

	cycleColor: ->
		colors = Switch.COLORS
		currentColor = @get 'color'
		for index in [0...colors.length]
			if colors[index] is currentColor
				newColor = colors[if index is colors.length - 1 then 0 else index + 1]
		@set 'color', newColor

@app.Switch = Switch

