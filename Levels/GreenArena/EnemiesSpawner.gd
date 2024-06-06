extends Node

const TriangleBird = preload("res://Enemies/triangle_bird.tscn")
const Sqweirdo = preload("res://Enemies/sqweirdo.tscn")

const MAX_NUMBER_OF_BIRDS = 1
const MAX_NUMBER_OF_SQWEIRDOS = 1

const BIRD_PLAYER_Y_DELTA = -200
const BASELINE_HEIGHT_DELTA = 100

const LEFT_OUT_OF_SCREEN_X = -200
const RIGHT_OUT_OF_SCREEN_X = 1200

var rng = RandomNumberGenerator.new()

func _process(delta):
	var numberOfBirds = 0
	var numberOfSqweirdos = 0
	
	for node in get_node("../Enemies").get_children():
		if(node.is_in_group("birds")):
			numberOfBirds += 1
		elif(node.is_in_group("sqweirdos")):
			numberOfSqweirdos += 1
	
	if(numberOfBirds < MAX_NUMBER_OF_BIRDS):
		spawnBirdOverPlayer()
	if(numberOfSqweirdos < MAX_NUMBER_OF_SQWEIRDOS):
		spawnSqweirdos()

func spawnBirdOverPlayer():
	var playerPosition = get_node("../Player").position
	var startX = getStartingX()
	
	var triangleBird = TriangleBird.instantiate()
	triangleBird.playerNode = get_node("../Player")
	triangleBird.position = Vector2(startX ,playerPosition.y + BIRD_PLAYER_Y_DELTA)
	triangleBird.baselineHeight = triangleBird.position.y - BASELINE_HEIGHT_DELTA
	get_node("../Enemies").add_child(triangleBird)

func spawnSqweirdos():
	var playerPosition = get_node("../Player").position
	var startX = getStartingX()
	
	var sqweirdo = Sqweirdo.instantiate()
	sqweirdo.position.x = startX
	sqweirdo.playerNode = get_node("../Player")
	get_node("../Enemies").add_child(sqweirdo)
	
func getStartingX() -> int:
	var startX = 0
	if(rng.randi_range(1,2) == 1):
		startX = LEFT_OUT_OF_SCREEN_X
	else:
		startX = RIGHT_OUT_OF_SCREEN_X
	return startX
	
