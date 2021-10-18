extends Control

onready var _animation_player: AnimationPlayer = $AnimationPlayer
signal game_over


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PauseButton_pressed():
	$PressButton.play()
	get_tree().paused = true
	$AnimationPlayer.play("Pause")

func _on_PauseUi_play():
	$AnimationPlayer.play_backwards("Pause")
	yield(_animation_player,"animation_finished")
	get_tree().paused = false

func _on_Life_value_changed(value):
	if value == 0:
		emit_signal("game_over")

func game_over():
	get_tree().paused = true
	$AnimationPlayer.play("GameOver")
