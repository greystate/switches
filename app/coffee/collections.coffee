class SwitchBoard extends Backbone.Collection
	model: Switch

	saveConfiguration: =>
		@invoke 'save'
	
	localStorage: new Backbone.LocalStorage "SwitchBoardStore"

@app.SwitchBoard = SwitchBoard