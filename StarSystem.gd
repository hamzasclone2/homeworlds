extends Node2D

var color
var size
var spaceShipArray = []

func addSpaceShip():
	var spaceShip = load("SpaceShip.tscn").instance()
	add_child(spaceShip)
	spaceShipArray.append(spaceShip)
	print(spaceShipArray.back())
