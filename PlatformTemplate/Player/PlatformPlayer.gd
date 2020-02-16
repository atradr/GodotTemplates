extends KinematicBody2D

const MAX_SPEED : float = 300.0
const MAX_AIR_SPEED : float = 300.0
const JUMP_SPEED : float = 400.0
const GRAVITY_ACCEL : float = 700.0
const LERP_WEIGHT : float = 0.5

var velocity : Vector2 = Vector2.ZERO

var horiz_direction_next = 1
var horiz_direction_current = 1

var anim_next = ""
var anim_current = ""

onready var sprite = $Sprite
onready var anim = $AnimationPlayer

var machine

func _ready():
	machine = StateMachine.new(self, $States, $States/idle, true)
	
func _physics_process(delta):
	machine.run(delta)
	
	if anim_next != anim_current:
			anim_current = anim_next
			$anim.play( anim_current )
			
	# Set facing direction.
	horiz_direction_next = _get_horiz_input()
	if horiz_direction_current != horiz_direction_next and horiz_direction_next != 0:
		horiz_direction_current = horiz_direction_next
		#sprite.flip_h = !sprite.flip_h
		sprite.scale.x = horiz_direction_current * abs(sprite.scale.x)

func _get_horiz_input():
	return int(Input.is_action_pressed("left")) * -1 \
			+ int(Input.is_action_pressed("right")) * 1
