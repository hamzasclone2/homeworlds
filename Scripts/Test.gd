extends Node2D

onready var bank = get_node("Bank")
onready var sizeSelector = get_node("Control/SizeSelector")
onready var colorSelector = get_node("Control/ColorSelector")
var starSystemArray = []
var starSystemYPos = 450
var starSystemXPos = 50

var colorSelected

func _ready():
	bank.initialize()


func _on_TakeButton_button_up():
	takeHelper()


func _on_PutBackButton_button_up():
	putBackHelper()


func _on_AddStarSystem_button_up():
	takeHelper()
	
	var starSystem = load("Scenes/StarSystem.tscn").instance()
	add_child(starSystem)
	starSystem.setup(colorSelected, sizeHelper())
	
	starSystem.position = Vector2(starSystemXPos, starSystemYPos)
	starSystemArray.append(starSystem)
	starSystemXPos += 100


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
	starSystemArray[0].addSpaceShip(colorSelected, sizeHelper())