class_name Player
extends CharacterBody2D
## This is the class used to configure the player's parameters

@export var SPEED = 750.0


func _ready():
	set_position(Vector2(0.0, 500))


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_move_left", "player_move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_kill_zone_body_entered(_body):
	_reset()


func _reset():
	set_position(Vector2(0.0, 500))
	set_velocity(Vector2(0.0, 0.0))
