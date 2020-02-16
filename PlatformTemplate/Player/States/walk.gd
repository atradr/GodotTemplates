extends State

func initialize():
	pass

func terminate():
	pass

func run(delta):
	var dx = obj._get_horiz_input()
	if dx == 0:
		machine.next_state = machine.STATES.idle
		return
	
	if Input.is_action_pressed("jump"):
		machine.next_state = machine.STATES.jump
		return
	
	obj.velocity.x = lerp(obj.velocity.x, dx * obj.MAX_SPEED, obj.LERP_WEIGHT)
	obj.velocity.y = 1 # So that it can check if it's on the floor
	
	obj.move_and_slide(obj.velocity, Vector2(0, -1))
	
	if !obj.is_on_floor():
		machine.next_state = machine.STATES.fall
	
