extends State

onready var jump_timer = $JumpTimer

func initialize():
	obj.velocity.y = -obj.JUMP_SPEED
	jump_timer.start()

func terminate():
	pass

func run(delta):
	if !Input.is_action_pressed("jump"):
		machine.next_state = machine.STATES.fall
		jump_timer.stop()
		# This cuts the jump short without feeling abrupt!
		obj.velocity.y *= 0.5
	
	#obj.velocity.y += obj.jump_gravity * delta
	
	var dx = obj._get_horiz_input()
	obj.velocity.x = lerp(obj.velocity.x, dx * obj.MAX_AIR_SPEED, obj.LERP_WEIGHT)
	
	obj.move_and_slide(obj.velocity, Vector2.UP)
	
	if obj.is_on_ceiling():
		obj.velocity.y = 0
		machine.next_state = machine.STATES.fall
		
	if jump_timer.is_stopped():#obj.velocity.y >= 0:
		obj.velocity.y *= 0.5
		machine.next_state = machine.STATES.fall
