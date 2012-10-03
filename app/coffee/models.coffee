class Switch extends Backbone.Model
	defaults:
		color: "rgba(255, 0, 0, 0.8)"
		state: 'on'
	
	isOn: -> @get('state') is 'on'
	isOff: -> @get('state') is 'off'
	
	toggleState: -> @set 'state', not @isOn()

@app.Switch = Switch

