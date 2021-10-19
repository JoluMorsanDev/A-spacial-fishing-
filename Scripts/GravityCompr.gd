extends Area2D

export var behave = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if behave == true:
		if Input.is_action_just_pressed("gravitystart"):
			$CollisionShape2D.set_deferred("disabled", false)
			show()
		if Input.is_action_just_released("gravitystop"):
			$CollisionShape2D.set_deferred("disabled", true)
			hide()
		global_position = get_global_mouse_position()
