extends Node2D

var color
var size
var spaceShipArray = []
var spaceShipXPos = 50

func addSpaceShip():
	var spaceShip = load("SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShipArray.append(spaceShip)
	spaceShip.position = Vector2(spaceShipXPos, 0)
	spaceShipXPos += 50
