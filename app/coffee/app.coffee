# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class SwitchBoardController
	constructor: () ->
		@setupBoard()
	
	setupBoard: () ->
		$('.switchboard').on 'click', '.switch a', ->
			$sw = $(this).parent()
			$sw.toggleClass 'on off'


# Start everything when the page is ready
$ ->
	app.controller = new SwitchBoardController