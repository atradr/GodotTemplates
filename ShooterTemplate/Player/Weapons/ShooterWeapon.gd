extends Node2D

var parent
var bullet_holder
var barrel

func _ready():
	parent = get_parent()
	
func fire():
	pass

func add_bullet(bullet):
	bullet_holder.add_child(bullet)
