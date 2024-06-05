extends Node

const Bullet = preload("res://Bullets/basic_player_bullet.tscn")

func _on_player_bullet_fired(bulletDirection, playerPosition, bulletType):
	var playerBullet = Bullet.instantiate()
	playerBullet.position = playerPosition
	playerBullet.direction = bulletDirection
	playerBullet.bulletType = bulletType
	
	get_node("../Bullets/Player").add_child(playerBullet)

func _on_player_bullet_changed(bulletType):
	get_node("../UI/TextureRect").texture = load("res://assets/bullets/"+bulletType.to_lower()+"_bullet.png")
