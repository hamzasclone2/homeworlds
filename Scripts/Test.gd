extends Node2D

onready var bank = get_node("Bank")
onready var sizeSelector = get_node("Control/SizeSelector")
onready var colorSelector = get_node("Control/ColorSelector")
onready var playerLabel = get_node("Control/PlayerLabel")
var starSystemArray = []
var starSystemYPos = 450
var starSystemXPos = 50
var starSystemID = 0
var selectedStarSystem = 0

var colorSelected
var playerTurn = 1


func _ready():
	bank.initialize()
	playerLabel.text = "Player 1's Turn"


func _on_TakeButton_button_up():
	takeHelper()


func _on_PutBackButton_button_up():
	putBackHelper()


func _on_AddStarSystem_button_up():
	takeHelper()
	
	var starSystem = load("Scenes/StarSystem.tscn").instance()
	add_child(starSystem)
	starSystem.setup(colorSelected, sizeHelper(), starSystemID)
	starSystemID += 1
	starSystem.position = Vector2(starSystemXPos, starSystemYPos)
	starSystemArray.append(starSystem)
	starSystemXPos += 300


func sizeHelper():
	if(Array(sizeSelector.get_selected_items()) == [0]):
		return 3
	elif(Array(sizeSelector.get_selected_items()) == [1]):
		return 2
	elif(Array(sizeSelector.get_selected_items()) == [2]):
		return 1


func takeHelper():
	var size = sizeHelper()
	if(Array(colorSelector.get_selected_items()) == [0]):
		bank.takeGreen(size)
		colorSelected = 'Green'
	elif(Array(colorSelector.get_selected_items()) == [1]):
		bank.takeYellow(size)
		colorSelected = 'Yellow'
	if(Array(colorSelector.get_selected_items()) == [2]):
		bank.takeRed(size)
		colorSelected = 'Red'
	if(Array(colorSelector.get_selected_items()) == [3]):
		bank.takeBlue(size)
		colorSelected = 'Blue'


func putBackHelper():
	var size = sizeHelper()
	if(Array(colorSelector.get_selected_items()) == [0]):
		bank.putBackGreen(size)
	elif(Array(colorSelector.get_selected_items()) == [1]):
		bank.putBackYellow(size)
	if(Array(colorSelector.get_selected_items()) == [2]):
		bank.putBackRed(size)
	if(Array(colorSelector.get_selected_items()) == [3]):
		bank.putBackBlue(size)


func _on_AddShipToStar_button_up():
	takeHelper()
	starSystemArray[selectedStarSystem].addSpaceShip(colorSelected, sizeHelper(), playerTurn)


func _on_NextTurnButton_button_up():
	if(playerTurn == 1):
		playerTurn = 2
		playerLabel.text = "Player 2's Turn"
	elif(playerTurn == 2):
		playerTurn = 1
		playerLabel.text = "Player 1's Turn"
