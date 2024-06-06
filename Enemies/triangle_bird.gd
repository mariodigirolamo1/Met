extends CharacterBody2D

const HORIZONTAL_SPEED = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# instead of making the bird flap once every x seconds, we're gonna do it
# once it travelled a certain heigh
var flapHeightDeltaTrigger = 150
# when we spawn the bird this need to be set and reflect
# this baseline can be modified in the future to move the bird
# around the screen in y
var baselineHeight = 400
var playerNode

func _physics_process(delta):
	applyGravity(delta)
	handleFlap(delta)
	followPlayerX(delta)
	updateSprite()
	move_and_slide()
	
func applyGravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
func handleFlap(delta):
	if(baselineHeight + flapHeightDeltaTrigger <= position.y):
		velocity.y = JUMP_VELOCITY
		
func followPlayerX(delta):
	velocity.x = playerNode.position.x - position.x * delta * HORIZONTAL_SPEED

func updateSprite():
	if position.x < playerNode.position.x:
		get_node("Sprite2D").flip_h = false
	else:
		get_node("Sprite2D").flip_h = true

func _on_hitbox_area_entered(area):
	if(area is Bullet):
		var bullet = area as Bullet
		if(bullet.bulletType == BulletTypes.TRIANGLE):
			self.queue_free()
	area.queue_free()
