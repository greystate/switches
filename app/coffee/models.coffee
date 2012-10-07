class Switch extends Backbone.Model
	defaults:
		color: 'red'
		state: 'on'
	
	isOn: -> @get('state') is 'on'
	isOff: -> @get('state') is 'off'
	
	toggleState: -> @set 'state', if @isOn() then 'off' else 'on'

@app.Switch = Switch

