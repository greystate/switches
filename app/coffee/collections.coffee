class SwitchBoard extends Backbone.Collection
	model: Switch
	
	localStorage: new Backbone.LocalStorage "SwitchBoardStore"

@app.SwitchBoard = SwitchBoard