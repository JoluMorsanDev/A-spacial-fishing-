extends KinematicBody2D

var BH = load("res://Scenes/BlackHole.tscn")
export var side = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(1,1,1,1)
	yield(get_tree().create_timer(rand_range(.5,2)),"timeout")
	$AnimationPlayer2.play("Nueva Animación")
	yield(get_tree().create_timer(.5),"timeout")
	var bh = BH.instance()
	get_parent().add_child(bh)
	bh.global_position = global_position
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprites.scale.x = -side
	global_position.x += 400 * delta * side


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
