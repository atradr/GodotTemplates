extends Node

var velocity : Vector2 = Vector2.ZERO
var last_velocity : Vector2 = Vector2.ZERO

var friction_amt = .15

onready var p = get_parent()

func get_velocity():
	return velocity * p.SPEED

func _physics_process(delta):
	velocity  = Vector2(int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")),
					int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))).normalized()
					
	#fuckin magical movement right here
	velocity = lerp(last_velocity, velocity, friction_amt)
	last_velocity = velocity
	if velocity.length() < 0.1:
		velocity = Vector2.ZERO
