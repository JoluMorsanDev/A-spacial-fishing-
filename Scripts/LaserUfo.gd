extends KinematicBody2D

var Laser = load("res://Scenes/Laser.tscn")
var target = Vector2(0,0)
export var side = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Sprites.scale.x = -side
	global_position.x += 400 * delta * side


func _on_Area2D_body_entered(body):
	if body.planet != null:
		match side:
			1:
				target = body.global_position
				$Sprites/Laser.look_at(target)
				shoot(1)
			-1:
				target = -body.global_position
				$Sprites/Laser.look_at(target*Vector2(-1,-1))
				shoot(1)

func shoot(rot):
	yield(get_tree().create_timer(0.4),"timeout")
	var laser = Laser.instance()
	get_parent().call_deferred("add_child", laser)
	laser.global_position = $Sprites/Laser.global_position
	laser.global_rotation = $Sprites/Laser.global_rotation 
	laser.side = rot


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
