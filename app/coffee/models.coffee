class Switch extends Backbone.Model
	defaults:
		color: "rgba(255, 0, 0, 0.8)"
		state: on
	
	isOn: -> state is on
	isOff: -> state is off

@app.Switch = Switch

