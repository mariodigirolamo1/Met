extends Node

const TriangleBird = preload("res://Enemies/triangle_bird.tscn")
var rng = RandomNumberGenerator.new()

const MAX_NUMBER_OF_ENEMIES = 1

const BIRD_PLAYER_Y_DELTA = -200
const BASELINE_HEIGHT_DELTA = 100

const LEFT_OUT_OF_SCREEN_X = -200
const RIGHT_OUT_OF_SCREEN_X = 1200

func _process(delta):
	var numberOfEnemies = get_node("../Enemies").get_child_count()
	if(numberOfEnemies < MAX_NUMBER_OF_ENEMIES):
		spawnBirdOverPlayer()

func spawnBirdOverPlayer():
	var playerPosition = get_node("../Player").position
	var startX
	if(rng.randi_range(1,2) == 1):
		startX = LEFT_OUT_OF_SCREEN_X
	else:
		startX = RIGHT_OUT_OF_SCREEN_X
	
	var triangleBird = TriangleBird.instantiate()
	triangleBird.playerNode = get_node("../Player")
	triangleBird.position = Vector2(startX ,playerPosition.y + BIRD_PLAYER_Y_DELTA)
	triangleBird.baselineHeight = triangleBird.position.y - BASELINE_HEIGHT_DELTA
	get_node("../Enemies").add_child(triangleBird)
