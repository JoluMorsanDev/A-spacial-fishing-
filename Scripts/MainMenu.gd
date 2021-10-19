extends Node2D

var buttonmute = load("res://Assets/Sprites/sprite_40.png")
var buttonsound = load("res://Assets/Sprites/sprite_21.png")
var page = int(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if AudioServer.is_bus_mute(1):
		$Ui/SoundButton.texture_normal = buttonmute
	else:
		$Ui/SoundButton.texture_normal = buttonsound
	match page:
		1:
			$HowToPlay/Page1.show()
			$HowToPlay/Page2.hide()
			$HowToPlay/Page3.hide()
			$HowToPlay/Page4.hide()
			$HowToPlay/Pinned/Backhtp.hide()
			$HowToPlay/Pinned/Nexthtp.show()
		2:
			$HowToPlay/Page1.hide()
			$HowToPlay/Page2.show()
			$HowToPlay/Page3.hide()
			$HowToPlay/Page4.hide()
			$HowToPlay/Pinned/Backhtp.show()
			$HowToPlay/Pinned/Nexthtp.show()
		3:
			$HowToPlay/Page1.hide()
			$HowToPlay/Page2.hide()
			$HowToPlay/Page3.show()
			$HowToPlay/Page4.hide()
			$HowToPlay/Pinned/Backhtp.show()
			$HowToPlay/Pinned/Nexthtp.show()
		4:
			$HowToPlay/Page1.hide()
			$HowToPlay/Page2.hide()
			$HowToPlay/Page3.hide()
			$HowToPlay/Page4.show()
			$HowToPlay/Pinned/Backhtp.show()
			$HowToPlay/Pinned/Nexthtp.hide()

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
	page = 1

func _on_HTPButton_pressed():
	$PressButton.play()
	$HowToPlay.show()

func _on_Backcredits_pressed():
	$PressButton.play()
	$Credits.hide()

func _on_CreditsButton_pressed():
	$PressButton.play()
	$Credits.show()

func _on_Nexthtp_pressed():
	page += 1

func _on_Backhtp_pressed():
	page -= 1
