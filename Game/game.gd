class_name BreakoutGame
extends Node2D


# Variables
var score: int = 0
@export var brick: PackedScene
@onready var ball = $Ball

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_point = Vector2(-625.0, -450.0)
	
	for i in range(0, 10): # Spawn in bricks
		var brick_instance = brick.instantiate()
		brick_instance.scored_points.connect(_on_scored_points)
		add_child(brick_instance)
		brick_instance.set_position(spawn_point)
		spawn_point.x += 150


func _on_ball_dealt_damage(damage: int):
	print(str(damage))


func _on_scored_points(points: int):
	score += points
	print("points: " + str(score))
