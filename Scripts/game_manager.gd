extends Node

@onready var player_1 = %Player1

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.stop()


func _on_left_body_entered(body):
	pass
func _on_left_body_exited(body):
	pass # Replace with function body.
