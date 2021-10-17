extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("gravitystart"):
		$CollisionShape2D.set_deferred("disabled", false)
		$Polygon2D.show()
	if Input.is_action_just_released("gravitystop"):
		$CollisionShape2D.set_deferred("disabled", false)
		$Polygon2D.hide()
	global_position = get_global_mouse_position()