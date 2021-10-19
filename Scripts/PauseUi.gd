extends ColorRect

signal play
var buttonmute = load("res://Assets/Sprites/sprite_40.png")
var buttonsound = load("res://Assets/Sprites/sprite_21.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if AudioServer.is_bus_mute(1):
		$SoundButton.texture_normal = buttonmute
	else:
		$SoundButton.texture_normal = buttonsound

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
