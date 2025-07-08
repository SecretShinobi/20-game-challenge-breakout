class_name Ball
extends CharacterBody2D
## A ball that is bounced around on the screen in a top-down manner
##
## This is the ball that is bounced around between the two players in the pong
## game. The movement and behavior of the ball can be adjusted here

# Signals
signal life_lost
signal collided_brick(damage: int)

# Variables
var damage: int = 1
var lives: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0.0, -500.0))
	life_lost.connect(_reset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		# Change the bounce angle if ball hits paddle based on dist. from center
		var object = collision.get_collider()
		if object is Player:
			var ball_x = get_global_position().x
			var paddle_x = object.get_global_position().x
			velocity.x = (ball_x - paddle_x) * 5
		if object is Brick:
			object.decrease_health(damage)

# Functions
func _reset():
	set_position(Vector2(0.0, 0.0))
	set_velocity(Vector2(0.0, velocity.y))


func _on_collided_brick(damage):
	pass # Replace with function body.


func _on_kill_zone_body_entered(body):
	life_lost.emit()
