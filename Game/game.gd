class_name BreakoutGame
extends Node


# Variables
var score: int = 0
var lives: int = 3
var bricks_remaining: int = 0

@export var brick: PackedScene
@export var hud: HUD
@export var ball: Ball

# Signals


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.life_lost.connect(_on_life_lost)
	
	var start_point = Vector2(400.0, 200.0)
	
	for i in range(0, 5): # Spawn in bricks
		for j in range(0, 9):
			var spawn_point = Vector2(start_point.x + (120 * j), start_point.y + (50 * i)) 
			var brick_instance = brick.instantiate()
			brick_instance.scored_points.connect(_on_scored_points)
			add_child(brick_instance)
			bricks_remaining += 1
			brick_instance.set_position(spawn_point)


func _on_scored_points(points: int):
	score += points
	bricks_remaining -= 1
	hud.update_hud()
	ball.adjust_speed(50.0)


func _on_life_lost():
	lives -= 1
	if lives <= 0:
		ball.queue_free()
