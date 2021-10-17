extends Node2D

var Planet = load("res://Scenes/Planet.tscn")
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()


func _on_Wormhole_add_score():
	score += 200
	$Label.text = str(score)

func planet_exit():
	score -= 50
	$Label.text = str(score)


func _on_PlanetsTimer_timeout():
	var planet = Planet.instance()
	$Planets.add_child(planet)
	planet.global_position.y = -150
	planet.global_position.x = rand_range(-256, 1536-256)
