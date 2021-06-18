extends Node2D

var color
var size
var ownedBy
onready var GreenSprite = get_node("GreenSprite")
onready var YellowSprite = get_node("YellowSprite")
onready var RedSprite = get_node("RedSprite")
onready var BlueSprite = get_node("BlueSprite")
onready var SizeLabel = get_node("SizeLabel")

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
		
	SizeLabel.modulate =  Color(0, 0, 0)
	if(size == 1):
		SizeLabel.text = "I"
	elif(size == 2):
		SizeLabel.text = "II"
	elif(size == 3):
		SizeLabel.text = "III"

func build():
	pass
	
func move():
	pass
	
func attack():
	pass
	
func trade():
	pass
