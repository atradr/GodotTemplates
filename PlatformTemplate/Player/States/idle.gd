extends State

func initialize():
	obj.velocity = Vector2.ZERO

func terminate():
	pass

func run(delta):
	if obj._get_horiz_input() != 0:
		machine.next_state = machine.STATES.walk
	elif Input.is_action_pressed("jump"):
		machine.next_state = machine.STATES.jump
	elif !obj.is_on_floor():
		machine.next_state = machine.STATES.fall
