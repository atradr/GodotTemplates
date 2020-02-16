extends Area2D

var direction : Vector2
var speed : float = 500.0

func _physics_process(delta):
	position += speed * direction * delta
	
func setup(pos, rot):
	position = pos
	rotation = rot
	direction = Vector2(cos(rot), sin(rot))

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
