class_name HUD
extends Control

# Variables
@export var score: Label
@export var lives: Label
@export var game: BreakoutGame


# Called when the node enters the scene tree for the first time.
func _ready():
	update_hud()


func _on_kill_zone_body_entered(body):
	update_hud()


func update_hud():
	score.text = "score: " + str(game.score)
	lives.text = "lives: " + str(game.lives)
