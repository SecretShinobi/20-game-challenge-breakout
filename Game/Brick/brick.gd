class_name Brick
extends StaticBody2D

var health: int = 10
var value: int = 1

# Signals
signal scored_point(score: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_damaged_entity(damage):
	health -= damage
	if health <= 0:
		scored_point.emit(value)
		queue_free()
