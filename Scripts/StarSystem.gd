extends Node2D

var color
var size
var spaceShipXPos = 50
var isHovering = false
var isSelected = false
onready var GreenSprite = get_node("GreenSprite")
onready var YellowSprite = get_node("YellowSprite")
onready var RedSprite = get_node("RedSprite")
onready var BlueSprite = get_node("BlueSprite")

func setup(inputColor, inputSize):
	color = inputColor
	size = inputSize
	if(color == 'Green'):
		GreenSprite.visible = true
		YellowSprite.visible = false
		RedSprite.visible = false
		BlueSprite.visible = false
	elif(color == 'Yellow'):
		GreenSprite.visible = false
		YellowSprite.visible = true
		RedSprite.visible = false
		BlueSprite.visible = false
	elif(color == 'Red'):
		GreenSprite.visible = false
		YellowSprite.visible = false
		RedSprite.visible = true
		BlueSprite.visible = false
	elif(color == 'Blue'):
		GreenSprite.visible = false
		YellowSprite.visible = false
		RedSprite.visible = false
		BlueSprite.visible = true
		

func _input(event):
	if event.is_action_pressed("MouseClick") and isHovering:
		isSelected = !isSelected
		print(isSelected)

func addSpaceShip(inputColor, inputSize):
	var spaceShip = load("Scenes/SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShip.setup(inputColor, inputSize)
	
	spaceShip.position = Vector2(spaceShipXPos, 0)
	spaceShipXPos += 50

func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
