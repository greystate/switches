# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class SwitchBoardController
	constructor: () ->
		@setupBoard()
	
	setupBoard: () ->
		$('.switchboard').on 'click', '.switch a', ->
			$sw = $(this).parent()
			$sw.toggleClass('off').toggleClass('on')
			false

	buildASwitch: () ->
		switch1 = new app.Switch
		view1 = new app.SwitchView
			model: switch1
		($ '.switchboard').append view1.render().el

# Start everything when the page is ready
$ ->
	app.controller = new SwitchBoardController

# @codekit-append "models.coffee"
# @codekit-append "views.coffee"