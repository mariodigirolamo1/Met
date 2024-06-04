extends Node

const Bullet = preload("res://Bullets/basic_player_bullet.tscn")

func _on_player_bullet_fired(bulletDirection, playerPosition):
	var playerBullet = Bullet.instantiate()
	playerBullet.position = playerPosition
	playerBullet.direction = bulletDirection
	
	get_node("../Bullets/Player").add_child(playerBullet)
