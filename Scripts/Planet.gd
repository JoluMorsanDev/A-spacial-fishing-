extends RigidBody2D

var planet = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if rand_range(0,1) > 0.5:
		$Sprites/Moons.hide()
	if rand_range(0,1) > 0.5:
		$Sprites/Ring.hide()
	$Sprites/Planet.rotation_degrees = rand_range(0,360)
	$Sprites/Planet.rotation_degrees = rand_range(0,360)
	$Sprites/Ring.rotation_degrees = rand_range(0,360)
	$Sprites/Moons.rotation_degrees = rand_range(0,360)
# warning-ignore:narrowing_conversion
	$Sprites.modulate = Color8(226,rand_range(149,200),128,255)
	gravity_scale = rand_range(1.5,1.75)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	get_parent().get_parent().planet_exit()
	queue_free()
