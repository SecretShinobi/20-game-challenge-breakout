class_name BreakoutGame
extends Node2D


# Variables
var score: int = 0
@onready var brick = preload("res://Game/Brick/brick.tscn")

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_point = Vector2(-550.0, -450.0)
	for i in range(1, 10):
		var brick_instance = brick.instantiate()
		add_child(brick_instance)
		brick_instance.set_position(spawn_point)
		spawn_point.x += 150
