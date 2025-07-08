class_name BreakoutGame
extends Node2D


# Variables
var score: int = 0
var lives: int = 3
@export var brick: PackedScene
@onready var ball = $Ball

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.life_lost.connect(_on_life_lost)
	
	var spawn_point = Vector2(-625.0, -400.0)
	
	for i in range(0, 10): # Spawn in bricks
		var brick_instance = brick.instantiate()
		brick_instance.scored_points.connect(_on_scored_points)
		add_child(brick_instance)
		brick_instance.set_position(spawn_point)
		spawn_point.x += 150


func _on_scored_points(points: int):
	score += points
	print("points: " + str(score))


func _on_life_lost():
	lives -= 1
	if lives <= 0:
		print("game over")
		ball.queue_free()
