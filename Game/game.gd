class_name BreakoutGame
extends Node2D


# Variables
var score: int = 0
var lives: int = 3
@export var brick = preload("res://Game/Brick/brick.tscn")
@onready var ball = $Ball

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_point = Vector2(-625.0, -450.0)
	
	#for i in range(1, 11): # Spawn in bricks
		#var brick_instance = brick.instantiate()
		#add_child(brick_instance)
		#brick_instance.set_position(spawn_point)
		#spawn_point.x += 150


func _on_ball_dealt_damage(damage: int):
	print(str(damage))
