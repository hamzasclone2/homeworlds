extends Node2D

var color
var size
var ID
var isHovering = false

onready var GreenSprite = get_node("GreenSprite")
onready var YellowSprite = get_node("YellowSprite")
onready var RedSprite = get_node("RedSprite")
onready var BlueSprite = get_node("BlueSprite")

var numSpaceShipsP1 = 0
var numSpaceShipsP2 = 0
var spaceShipXP1 = 55
var spaceShipXP2 = -55

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

func addSpaceShip(inputColor, inputSize, playerTurn):
	var spaceShip = load("Scenes/SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShip.setup(inputColor, inputSize)
	
	if(playerTurn == 1):
		numSpaceShipsP1 += 1
		if(numSpaceShipsP1 % 2 == 1):
			spaceShip.position = Vector2(spaceShipXP1, -20)
		elif(numSpaceShipsP1 % 2 == 0):
			spaceShip.position = Vector2(spaceShipXP1, 20)
			spaceShipXP1 += 35
	elif(playerTurn == 2):
		numSpaceShipsP2 += 1
		spaceShip.rotation_degrees = 180
		if(numSpaceShipsP2 % 2 == 1):
			spaceShip.position = Vector2(spaceShipXP2, -20)
		elif(numSpaceShipsP2 % 2 == 0):
			spaceShip.position = Vector2(spaceShipXP2, 20)
			spaceShipXP2 -= 35
		
func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
