extends "res://Scripts/enemy.gd"

func enemy_ai() -> void:
	look_at(player.global_position)
	velocity = Vector2(120.0, 0).rotated(rotation)

func _ready() -> void:
	super()
	enemy_initial_hp = 60
	enemy_max_hp = enemy_initial_hp
	enemy_current_hp = enemy_max_hp
	enemy_damage = 8
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(enemy_max_hp)
	hpcomponent.set_current_hp(enemy_current_hp)
