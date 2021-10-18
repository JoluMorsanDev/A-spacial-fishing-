extends Area2D

var side = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += 600 * transform.x * delta * side


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


# warning-ignore:unused_argument
func _on_Laser_body_entered(body):
	queue_free()
