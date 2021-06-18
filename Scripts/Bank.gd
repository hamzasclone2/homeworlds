extends Node2D

onready var available_greens = []
onready var available_yellows = []
onready var available_reds = []
onready var available_blues = []

func _ready():
	available_greens = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_yellows = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_reds = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_blues = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	drawBank()

func _process(delta):
	available_greens.sort()
	available_yellows.sort()
	available_reds.sort()
	available_blues.sort()
	drawBank()
	
func drawBank():
	var square
	var pos = 10
	var yPos = 0
	for i in available_greens:
		square = load("Scenes/BankSquare.tscn").instance()
		add_child(square)
		square.init('Green', i)
		square.position = Vector2(pos, yPos)
		pos += 35
	pos = 10
	yPos += 35
	for i in available_yellows:
		square = load("Scenes/BankSquare.tscn").instance()
		add_child(square)
		square.init('Yellow', i)
		square.position = Vector2(pos, yPos)
		pos += 35
	pos = 10
	yPos += 35
	for i in available_reds:
		square = load("Scenes/BankSquare.tscn").instance()
		add_child(square)
		square.init('Red', i)
		square.position = Vector2(pos, yPos)
		pos += 35
	pos = 10
	yPos += 35
	for i in available_blues:
		square = load("Scenes/BankSquare.tscn").instance()
		add_child(square)
		square.init('Blue', i)
		square.position = Vector2(pos, yPos)
		pos += 35
	

func takeGreen(size):
	available_greens.erase(size)
	
func takeSmallestGreen():
	return available_greens.pop_front()
	
func takeYellow(size):
	available_yellows.erase(size)
	
func takeSmallestYellow():
	return available_yellows.pop_front()
	
func takeRed(size):
	available_reds.erase(size)
	
func takeSmallestRed():
	return available_reds.pop_front()
	
func takeBlue(size):
	available_blues.erase(size)
	
func takeSmallestBlue():
	return available_blues.pop_front()
	
func putBackGreen(size):
	available_greens.append(size)
	
func putBackYellow(size):
	available_yellows.append(size)
	
func putBackRed(size):
	available_reds.append(size)
	
func putBackBlue(size):
	available_blues.append(size)
