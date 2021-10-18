extends ColorRect

signal play

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	$PressButton.play()
	emit_signal("play")


func _on_HomeButton_pressed():
	$PressButton.play()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_RestartButton_pressed():
	$PressButton.play()
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _on_SoundButton_pressed():
	$PressButton.play()
	if AudioServer.is_bus_mute(1):
		AudioServer.set_bus_mute(1, false)
	else:
		AudioServer.set_bus_mute(1, true)
