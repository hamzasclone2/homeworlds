extends Node2D

var color
var size
var isHovering = false
var ID
onready var GreenSprite = get_node("GreenSprite")
onready var YellowSprite = get_node("YellowSprite")
onready var RedSprite = get_node("RedSprite")
onready var BlueSprite = get_node("BlueSprite")

var numSpaceShips = 0
var spaceShipX = 55

func setup(inputColor, inputSize, starSystemID):
	color = inputColor
	size = inputSize
	ID = starSystemID
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
		get_parent().selectedStarSystem = ID

func addSpaceShip(inputColor, inputSize):
	numSpaceShips += 1
	var spaceShip = load("Scenes/SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShip.setup(inputColor, inputSize)
	
	if(numSpaceShips % 2 == 1):
		spaceShip.position = Vector2(spaceShipX, -20)
	elif(numSpaceShips % 2 == 0):
		spaceShip.position = Vector2(spaceShipX, 20)
		spaceShipX += 35 
func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
