extends "res://ShooterTemplate/Player/Weapons/ShooterWeapon.gd"

export (PackedScene) var Bullet

var bullets_per_sec : int = 5

func _ready():
	print(position)
	print(global_position)
	print(get_parent().position)
	
func fire():
	setup_bullet()

func setup_bullet():
	var bullet = Bullet.instance()
	bullet.setup(barrel.global_position, parent.rotation)
	add_bullet(bullet)
