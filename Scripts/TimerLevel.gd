extends Node2D

var Planet = load("res://Scenes/Planet.tscn")
var Ufo = load("res://Scenes/LaserUfo.tscn")
var BhUfo = load("res://Scenes/BlackHoleUfo.tscn")
var score = 0
var life = 15
var time = 60
var startspawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$Ui/Life.hide()
	if Input.is_action_just_released("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	score = clamp(score, 0, INF)
	$Ui/ScoreLabel.text = "Score: " + str(score) + "\nTime: " + str(time)
	life = clamp(life, 0, 15)
	$Ui/Life.value = life

func _on_Wormhole_add_score():
	match int(rand_range(0,4)):
		0:
			$WormHole/Wormhole.global_position = $"WormHole/1".global_position
		1:
			$WormHole/Wormhole.global_position = $"WormHole/2".global_position
		2:
			$WormHole/Wormhole.global_position = $"WormHole/3".global_position
		3:
			$WormHole/Wormhole.global_position = $"WormHole/4".global_position
	score += 200
	if score >= 300 and startspawn == false:
		$Enemies/Enemie1Timer.start()
		$Enemies/Enemie2Timer.start()
		$Timer.start()
		startspawn = true

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
	$Enemies/Enemie1Timer.wait_time -= .05
	$Enemies/Enemie1Timer.wait_time = clamp($Enemies/Enemie1Timer.wait_time, 1.75, INF)

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
	$Enemies/Enemie2Timer.wait_time -= .05
	$Enemies/Enemie2Timer.wait_time = clamp($Enemies/Enemie2Timer.wait_time, 2.75, INF)

func reduce_life():
	score -= 50
	life -= 1

func _on_Ui_game_over():
# warning-ignore:return_value_discarded
	pass

func _on_Timer_timeout():
	time -= 1
	if time == 0:
		game_over()
		
func game_over():
	$Ui/GameOverUI/Label.text = "Time Over"
	$Ui/GameOverUI/ScoreUi.text = "Score: " + str(score)
	$Ui.game_over()
