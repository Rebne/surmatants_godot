extends Control
@onready var background = $Background

const FRAME_DURATION = 0.1

func _ready():
	for i in range(6):
		background.texture.set_frame_duration(i, FRAME_DURATION)
		
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options.tscn")


func _on_exit_pressed():
	get_tree().quit()
