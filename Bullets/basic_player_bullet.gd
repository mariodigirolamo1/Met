extends Node2D

class_name Bullet

const SPEED = 1200

var direction = Vector2(0,0)
var bulletType = BulletTypes.SQUARE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta
	rotation += 2 * delta
	setBulletSprite()
			
func setBulletSprite():
	get_node("Sprite2D").texture = load("res://assets/bullets/"+ bulletType.to_lower() +"_bullet.png")
