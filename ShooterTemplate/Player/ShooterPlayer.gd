extends KinematicBody2D

const SPEED : float = 350.0

var velocity : Vector2 = Vector2.ZERO

var weapons = {"BasicGun" : "res://ShooterTemplate/Player/Weapons/BasicGun.tscn"}
var current_weapon

onready var movement_script = $MovementScript

func _ready():
	current_weapon = load(weapons["BasicGun"]).instance()
	current_weapon.bullet_holder = get_parent()
	current_weapon.barrel = $Barrel
	add_child(current_weapon)

func _process(delta):
	if Input.is_action_pressed("fire"):
		current_weapon.fire()

func _physics_process(delta):
	rotation = position.angle_to_point(get_global_mouse_position()) + PI
	
	velocity = movement_script.get_velocity()
	move_and_slide(velocity)

func _input(event):
	if event.is_action_pressed("fire"):
		current_weapon.fire()
