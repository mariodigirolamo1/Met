extends Node2D

const SPEED = 1200

var direction = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta
	rotation += 2 * delta
