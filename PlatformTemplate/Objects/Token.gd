extends Area2D

func _on_Token_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("Collected")
