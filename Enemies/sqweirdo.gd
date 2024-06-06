extends CharacterBody2D

const CAP_SPEED_X = 100
const ACCELERATION_X = 10
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var playerNode

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	updateXSpeed()
	move_and_slide()
	
func updateXSpeed():
	if(position < playerNode.position):
		get_node("Sprite2D").flip_h = false
		if(velocity.x < CAP_SPEED_X):
			velocity.x += ACCELERATION_X
	else:
		get_node("Sprite2D").flip_h = true
		if(velocity.x > -CAP_SPEED_X):
			velocity.x -= ACCELERATION_X
			
func _on_hitbox_area_entered(area):
	if(area is Bullet):
		var bullet = area as Bullet
		if(bullet.bulletType == BulletTypes.SQUARE):
			self.queue_free()
	area.queue_free()
