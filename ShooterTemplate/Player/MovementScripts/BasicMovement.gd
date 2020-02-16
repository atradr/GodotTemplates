extends Node

onready var p = get_parent()

func get_velocity():
	var vel = calc_direction() * p.SPEED
	return vel

func calc_direction():
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		dir.x += 1
	if Input.is_action_pressed("left"):
		dir.x -= 1
	if Input.is_action_pressed("up"):
		dir.y -= 1
	if Input.is_action_pressed("down"):
		dir.y += 1
	
	return dir.normalized()