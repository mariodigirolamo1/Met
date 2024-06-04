extends CharacterBody2D

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

func _physics_process(delta):
	applyGravity(delta)
	handleFlap(delta)
	move_and_slide()
	
func applyGravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
func handleFlap(delta):
	if(baselineHeight + flapHeightDeltaTrigger <= position.y):
		velocity.y = JUMP_VELOCITY
