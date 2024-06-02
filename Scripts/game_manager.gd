extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.stop()

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
