extends Control

onready var Bank = get_node("/root/Test/Bank")
onready var gButton = get_node("Buttons/GreenButton")
onready var yButton = get_node("Buttons/YellowButton")
onready var rButton = get_node("Buttons/RedButton")
onready var bButton = get_node("Buttons/BlueButton")

var shipsPresent = []

func availableColors(ships):
	if("Green" in ships):
		gButton.visible = true
	if("Yellow" in ships):
		yButton.visible = true
	if("Red" in ships):
		rButton.visible = true
	if("Blue" in ships):
		bButton.visible = true

func _on_GreenButton_button_up():
	get_parent().addSpaceShip('Green', Bank.takeSmallestGreen())
	queue_free()


func _on_YellowButton_button_up():
	get_parent().addSpaceShip('Yellow', Bank.takeSmallestYellow())
	queue_free()


func _on_RedButton_button_up():
	get_parent().addSpaceShip('Red', Bank.takeSmallestRed())
	queue_free()


func _on_BlueButton_button_up():
	get_parent().addSpaceShip('Blue', Bank.takeSmallestBlue())
	queue_free()
