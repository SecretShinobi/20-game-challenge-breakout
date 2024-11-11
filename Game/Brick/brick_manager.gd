class_name BrickManager
extends Node2D
## Class that is responsible for managing the bricks
##
## This class is made to automate the spawning process of the bricks in the game
## as well managing the bricks themselves
var brick


func _ready():
	var brick = Brick.new()
	add_child(brick)
	print("brick should be loaded")
