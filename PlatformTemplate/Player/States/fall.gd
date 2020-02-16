extends State

func initialize():
	pass

func terminate():
	pass

func run(delta):
	obj.velocity.y += obj.GRAVITY_ACCEL * delta
	
	var dx = obj._get_horiz_input()
	obj.velocity.x = lerp(obj.velocity.x, dx * obj.MAX_AIR_SPEED, obj.LERP_WEIGHT)
	
	obj.move_and_slide(obj.velocity, Vector2(0, -1))
	
	if obj.is_on_floor():
		if dx == 0:
			machine.next_state = machine.STATES.idle
		else:
			machine.next_state = machine.STATES.walk

