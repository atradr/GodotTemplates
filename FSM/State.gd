extends Node
class_name State

var obj
var machine

# Gives access to the object the machine is a part of and the machine itself.
func _set_parent(new_obj, new_machine):
	obj = new_obj
	machine = new_machine
	
func initialize():
	pass

func terminate():
	pass

func run(delta):
	pass
