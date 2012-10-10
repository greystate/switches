class SwitchBoard extends Backbone.Collection
	model: Switch

	keep: ->
		@invoke 'save'

	wipe: ->
		while @length isnt 0
			(@at 0).destroy()
	
	localStorage: new Backbone.LocalStorage "SwitchBoardStore"

@app.SwitchBoard = SwitchBoard