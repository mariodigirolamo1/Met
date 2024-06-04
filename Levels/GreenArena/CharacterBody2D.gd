extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -700.0
const SHOT_COOLDOWN_IN_SECONDS = 0.5

signal bullet_fired(bulletDirection: Vector2, playerPosition: Vector2)

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lastBulletDelay = 100

func _physics_process(delta):
	setVelocity(delta)
	move_and_slide()
	checkShots(delta)

func setVelocity(delta):
	if not is_on_floor():
		velocity.y += 2.5 * gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = getMovementDirection()
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func getMovementDirection() -> int :
	var direction = 0
	if(Input.is_action_pressed("MOVE_LEFT")):
		get_node("Sprite2D2").flip_h = true
		direction = -1
	elif(Input.is_action_pressed("MOVE_RIGHT")):
		get_node("Sprite2D2").flip_h = false
		direction = 1
	return direction
	
func checkShots(delta):
	lastBulletDelay += delta
	if(lastBulletDelay >= SHOT_COOLDOWN_IN_SECONDS):
		var direction = getBulletDirection()
		if(direction != Vector2(0,0)):
			bullet_fired.emit(direction, position)
			lastBulletDelay = 0
	
func getBulletDirection() -> Vector2 :
	var bulletDirection = Vector2(0,0)
	if(Input.is_action_pressed("FIRE_DOWN")):
		bulletDirection = Vector2(0,1)
	if(Input.is_action_pressed("FIRE_UP")):
		bulletDirection = Vector2(0,-1)
	if(Input.is_action_pressed("FIRE_LEFT")):
		bulletDirection = Vector2(-1,0)
	if(Input.is_action_pressed("FIRE_RIGHT")):
		bulletDirection = Vector2(1,0)
	return bulletDirection
