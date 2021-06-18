extends Node2D

var color
var size
var ID
var isHovering = false

onready var GreenSprite = get_node("GreenSprite")
onready var YellowSprite = get_node("YellowSprite")
onready var RedSprite = get_node("RedSprite")
onready var BlueSprite = get_node("BlueSprite")
onready var SizeLabel = get_node("SizeLabel")

var numSpaceShipsP1 = 0
var numSpaceShipsP2 = 0
var spaceShipXP1 = 55
var spaceShipXP2 = -55

var shipsP1 = []
var shipsP2 = []

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
		
	if(size == 1):
		SizeLabel.text = "I"
	elif(size == 2):
		SizeLabel.text = "II"
	elif(size == 3):
		SizeLabel.text = "III"
		

func _input(event):
	if event.is_action_pressed("MouseClick") and isHovering:
		get_parent().selectedStarSystem = ID

func addSpaceShip(inputColor, inputSize):
	var spaceShip = load("Scenes/SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShip.setup(inputColor, inputSize)
	
	if(Game.playerTurn == 1):
		numSpaceShipsP1 += 1
		shipsP1.append(inputColor)
		if(numSpaceShipsP1 % 2 == 1):
			spaceShip.position = Vector2(spaceShipXP1, -20)
		elif(numSpaceShipsP1 % 2 == 0):
			spaceShip.position = Vector2(spaceShipXP1, 20)
			spaceShipXP1 += 35
	elif(Game.playerTurn == 2):
		numSpaceShipsP2 += 1
		shipsP2.append(inputColor)
		spaceShip.rotation_degrees = 180
		if(numSpaceShipsP2 % 2 == 1):
			spaceShip.position = Vector2(spaceShipXP2, -20)
		elif(numSpaceShipsP2 % 2 == 0):
			spaceShip.position = Vector2(spaceShipXP2, 20)
			spaceShipXP2 -= 35

func build():
	if Game.playerTurn == 1:
		if(color == 'Green' or 'Green' in shipsP1):
			var buildMenu = load("Scenes/BuildMenu.tscn").instance()
			add_child(buildMenu)
			buildMenu.availableColors(shipsP1, Game.playerTurn)
	elif Game.playerTurn == 2:
		if(color == 'Green' or 'Green' in shipsP2):
			var buildMenu = load("Scenes/BuildMenu.tscn").instance()
			add_child(buildMenu)
			buildMenu.availableColors(shipsP2, Game.playerTurn)
			

func colonistBuild(inputColor):
	addSpaceShip(inputColor, 0) #update this!!

func _on_Area2D_mouse_entered():
	isHovering = true

func _on_Area2D_mouse_exited():
	isHovering = false
