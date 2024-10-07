class_name Ball
extends CharacterBody2D
## A ball that is bounced around on the screen in a top-down manner
##
## This is the ball that is bounced around between the two players in the pong
## game. The movement and behavior of the ball can be adjusted here


# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(-500.0, 0.0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		# Change the bounce angle if ball hits paddle based on dist. from center
		if collision.get_collider() is CharacterBody2D:
			var ball_y: float = get_global_position().y
			var paddle_y: float = collision.get_collider().get_global_position().y
			#velocity.x *= 1.1 # Increase speed for each bounce
			velocity.y = (ball_y - paddle_y) * 5


func reset_ball():
	set_position(Vector2(0.0, 0.0))
	set_velocity(Vector2(velocity.x, 0.0))


# Signal Methods
func _on_left_net_body_entered(body):
	reset_ball()


func _on_right_net_body_entered(body):
	reset_ball()
