extends Node2D

onready var bank = get_node("Bank")
onready var sizeSelector = get_node("SizeSelector")
onready var colorSelector = get_node("ColorSelector")

func _ready():
	bank.initialize()


func _on_TakeButton_button_up():
	var size
	if(Array(sizeSelector.get_selected_items()) == [0]):
		size = 3
	elif(Array(sizeSelector.get_selected_items()) == [1]):
		size = 2
	elif(Array(sizeSelector.get_selected_items()) == [2]):
		size = 1
	
	if(Array(colorSelector.get_selected_items()) == [0]):
		bank.takeGreen(size)
	elif(Array(colorSelector.get_selected_items()) == [1]):
		bank.takeYellow(size)
	if(Array(colorSelector.get_selected_items()) == [2]):
		bank.takeRed(size)
	if(Array(colorSelector.get_selected_items()) == [3]):
		bank.takeBlue(size)


func _on_PutBackButton_button_up():
	var size
	if(Array(sizeSelector.get_selected_items()) == [0]):
		size = 3
	elif(Array(sizeSelector.get_selected_items()) == [1]):
		size = 2
	elif(Array(sizeSelector.get_selected_items()) == [2]):
		size = 1
	
	if(Array(colorSelector.get_selected_items()) == [0]):
		bank.putBackGreen(size)
	elif(Array(colorSelector.get_selected_items()) == [1]):
		bank.putBackYellow(size)
	if(Array(colorSelector.get_selected_items()) == [2]):
		bank.putBackRed(size)
	if(Array(colorSelector.get_selected_items()) == [3]):
		bank.putBackBlue(size)
