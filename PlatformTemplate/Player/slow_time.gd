extends "res://Scripts/State.gd"

func initialize():
	obj.velocity.y = -obj.jump_speed
	obj.jump_timer.start()

func terminate():
	pass

func run(delta):
	if Input.is_action_pressed("jump"):
		machine.next_state = machine.STATES.jump
	
	#obj.velocity.y += obj.jump_gravity * delta
	
	var dx = obj._get_horiz_input()
	obj.velocity.x = lerp(obj.velocity.x, dx * obj.max_air_speed, obj.lerp_weight)
	
	obj.move_and_slide(obj.velocity * .1, Vector2.UP)