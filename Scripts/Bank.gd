extends Node2D

onready var available_greens = []
onready var available_yellows = []
onready var available_reds = []
onready var available_blues = []

onready var gLabel: Label = get_node("GreenLabel")
onready var yLabel: Label = get_node("YellowLabel")
onready var rLabel: Label = get_node("RedLabel")
onready var bLabel: Label = get_node("BlueLabel")

func _ready():
	available_greens = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_yellows = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_reds = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	available_blues = [1, 1, 1, 2, 2, 2, 3, 3, 3,]
	
func _process(delta):
	available_greens.sort()
	available_yellows.sort()
	available_reds.sort()
	available_blues.sort()
	gLabel.text = "Greens: " + String(available_greens)
	yLabel.text = "Yellows: " + String(available_yellows)
	rLabel.text = "Reds: " + String(available_reds)
	bLabel.text = "Blues: " + String(available_blues)
	
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
