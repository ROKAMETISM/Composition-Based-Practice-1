extends "res://Scripts/enemy.gd"

func enemy_ai() -> void:
	look_at(player.global_position)
	velocity = Vector2(100.0, 0).rotated(rotation)
