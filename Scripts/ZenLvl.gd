extends Node2D

var Planet = load("res://Scenes/Planet.tscn")
var Ufo = load("res://Scenes/LaserUfo.tscn")
var BhUfo = load("res://Scenes/BlackHoleUfo.tscn")
var score = 0
var life = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Ui/Life.hide()
	if Input.is_action_just_released("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	score = clamp(score, 0, INF)
	$Ui/ScoreLabel.text = "Score: " + str(score)
	life = clamp(life, 0, 25)
	$Ui/Life.value = life

func _on_Wormhole_add_score():
	score += 200

func planet_exit():
	score -= 50

func _on_PlanetsTimer_timeout():
	var planet = Planet.instance()
	$Planets.add_child(planet)
	planet.global_position.y = -150
	planet.global_position.x = rand_range($"Planets/1".position.x, $"Planets/2".position.x)

func _on_Enemie1Timer_timeout():
	if rand_range(0,1) < .5:
		var ufo = Ufo.instance()
		$Enemies.add_child(ufo)
		if rand_range(0,1) < .5:
			ufo.global_position.x = $"Enemies/1".global_position.x
			ufo.global_position.y = rand_range($"Enemies/1".global_position.y,$"Enemies/2".global_position.y)
			ufo.side = 1
		else:
			ufo.global_position.x = $"Enemies/3".global_position.x
			ufo.global_position.y = rand_range($"Enemies/3".global_position.y,$"Enemies/4".global_position.y)
			ufo.side = -1
	else:
		var ufo = Ufo.instance()
		$Enemies.add_child(ufo)
		ufo.global_position.x = $"Enemies/1".global_position.x
		ufo.global_position.y = rand_range($"Enemies/1".global_position.y,$"Enemies/2".global_position.y)
		ufo.side = 1
		var ufo2 = Ufo.instance()
		$Enemies.add_child(ufo2)
		ufo2.global_position.x = $"Enemies/3".global_position.x
		ufo2.global_position.y = rand_range($"Enemies/3".global_position.y,$"Enemies/4".global_position.y)
		ufo2.side = -1

func _on_Enemie2Timer_timeout():
	var ufo = BhUfo.instance()
	$Enemies.add_child(ufo)
	if rand_range(0,1) < .5:
		ufo.global_position.x = $"Enemies/1".global_position.x
		ufo.global_position.y = rand_range($"Enemies/1".global_position.y,$"Enemies/2".global_position.y)
		ufo.side = 1
	else:
		ufo.global_position.x = $"Enemies/3".global_position.x
		ufo.global_position.y = rand_range($"Enemies/3".global_position.y,$"Enemies/4".global_position.y)
		ufo.side = -1

func reduce_life():
	score -= 50
	life -= 1

func _on_Ui_game_over():
# warning-ignore:return_value_discarded
	pass
