extends Control

export (bool) var display_fps : bool = true
export (bool) var controlling_close : bool = true

onready var fps = $FPSLabel

func _ready():
	if !display_fps:
		fps.hide()
	
func _process(delta):
	if display_fps:
		fps.text = str(Engine.get_frames_per_second())

func _unhandled_key_input(event):
	if controlling_close and event.scancode == KEY_ESCAPE:
		get_tree().quit()