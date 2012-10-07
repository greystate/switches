# Global app object 
@app = window.app ? {}	

# Main controller for the page's functions
class SwitchBoardController
	constructor: ->
		# Let's create a SwitchBoard right away
		@setupBoard()

	setupBoard: ->
		# Create a SwitchBoard collection
		board = app.board = new SwitchBoard
		# and add a single Switch to it
		board.add new Switch
		# Create a view for the collection
		boardView = app.boardView = new SwitchBoardView
			collection: board
		# and render that to the page
		$('body').append boardView.render().el
		

	# Helper method for adding new switches
	buildASwitch: () ->
		app.board.add()

# Start everything when the page is ready
$ ->
	app.controller = new SwitchBoardController

# @codekit-append "models.coffee"
# @codekit-append "views.coffee"
# @codekit-append "collections.coffee"