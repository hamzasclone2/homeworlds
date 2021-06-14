extends Node2D

var color
var size
var spaceShipArray = []
var spaceShipXPos = 50
var isSelected = false
export var mouse_over: Color
export var mouse_exit: Color

func addSpaceShip():
	var spaceShip = load("SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShipArray.append(spaceShip)
	spaceShip.position = Vector2(spaceShipXPos, 0)
	spaceShipXPos += 50


func _on_Area2D_mouse_entered():
	print("hello!!!!")
	modulate = mouse_over


func _on_Area2D_mouse_exited():
	print("goodbye!")
	modulate = mouse_exit
