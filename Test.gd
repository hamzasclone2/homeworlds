extends Node2D

onready var bank = get_node("Bank")
onready var sizeSelector = get_node("SizeSelector")
onready var colorSelector = get_node("ColorSelector")
onready var starSystemList = get_node("StarSystemList")
var starSystemArray = []

func _ready():
	bank.initialize()


func _on_TakeButton_button_up():
	takeHelper()


func _on_PutBackButton_button_up():
	putBackHelper()


func _on_AddStarSystem_button_up():
	takeHelper()
	
	var starSystem = load("StarSystem.tscn").instance()
	add_child(starSystem)
	starSystem.size = sizeHelper()
	starSystemArray.append(starSystem)
	print(starSystemArray.back())


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
	elif(Array(colorSelector.get_selected_items()) == [1]):
		bank.takeYellow(size)
	if(Array(colorSelector.get_selected_items()) == [2]):
		bank.takeRed(size)
	if(Array(colorSelector.get_selected_items()) == [3]):
		bank.takeBlue(size)


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
	starSystemArray[0].addSpaceShip()
