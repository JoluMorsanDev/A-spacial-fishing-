extends Node2D

var Star = load("res://Scenes/Star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Timer.wait_time = rand_range(.25,.75)
	var star = Star.instance()
	add_child(star)
	star.global_position.x = rand_range($"1".global_position.x,$"2".global_position.x)
	if rand_range(0,1) > 0.5:
		star.get_node("Blue").hide()
		star.get_node("Yellow").show()
	else:
		star.get_node("Blue").show()
		star.get_node("Yellow").hide()
	$Timer.start()
