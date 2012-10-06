# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class SwitchBoardController
	constructor: ->
		# Let's add a switch right away
		@buildASwitch()

	# Helper method for showing interaction of model & view
	buildASwitch: () ->
		switch1 = new Switch
		view1 = new SwitchView
			model: switch1
		($ '.switchboard').append view1.render().el

# Start everything when the page is ready
$ ->
	app.controller = new SwitchBoardController

# @codekit-append "models.coffee"
# @codekit-append "views.coffee"