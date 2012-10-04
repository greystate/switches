# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class SwitchBoardController
	constructor: () ->
		@setupBoard()
	
	# Set up click events in board
	setupBoard: () ->
		$('.switchboard').on 'click', '.switch a', ->
			$sw = ($ this).parent()
			$sw.toggleClass('off').toggleClass('on')
			false

	# Helper method for showing interaction of model & view
	buildASwitch: () ->
		switch1 = new Switch
		view1 = new SwitchView model: switch1
		($ '.switchboard').append view1.render().el

# Start everything when the page is ready
$ ->
	app.controller = new SwitchBoardController

# @codekit-append "models.coffee"
# @codekit-append "views.coffee"