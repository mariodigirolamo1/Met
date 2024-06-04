extends Node

const TriangleBird = preload("res://Enemies/triangle_bird.tscn")

const MAX_NUMBER_OF_ENEMIES = 1

const BIRD_PLAYER_Y_DELTA = -200
const BASELINE_HEIGHT_DELTA = 100

func _process(delta):
	var numberOfEnemies = get_node("../Enemies").get_child_count()
	if(numberOfEnemies < MAX_NUMBER_OF_ENEMIES):
		spawnBirdOverPlayer()

func spawnBirdOverPlayer():
	var triangleBird = TriangleBird.instantiate()
	triangleBird.position = get_node("../Player").position + Vector2(0,BIRD_PLAYER_Y_DELTA)
	triangleBird.baselineHeight = triangleBird.position.y - BASELINE_HEIGHT_DELTA
	get_node("../Enemies").add_child(triangleBird)
