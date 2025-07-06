class_name Brick
extends StaticBody2D

var health: int
var value: int

@onready var ball = get_node("../Ball")

# Signals


func _init(b_health = 1, points = 1):
	health = b_health
	value = points
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func decrease_health(damage: int):
	health -= damage
	if health <= 0:
		print("destroy me") # TODO: Update
