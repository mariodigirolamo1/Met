extends Node2D

const SPEED = 100

var direction = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta
	print(str(position))
