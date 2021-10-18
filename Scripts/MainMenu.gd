extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ArcadePlay_pressed():
	$PressButton.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Level.tscn")

func _on_ZenPlay_pressed():
	$PressButton.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/ZenLvl.tscn")

func _on_TimeLimitPlay_pressed():
	$PressButton.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/TimerLevel.tscn")

func _on_SoundButton_pressed():
	$PressButton.play()
	if AudioServer.is_bus_mute(1):
		AudioServer.set_bus_mute(1, false)
	else:
		AudioServer.set_bus_mute(1, true)

func _on_CloseButton_pressed():
	$PressButton.play()
	get_tree().quit()

func _on_Back_pressed():
	$PressButton.play()
	$HowToPlay.hide()

func _on_HTPButton_pressed():
	$PressButton.play()
	$HowToPlay.show()
