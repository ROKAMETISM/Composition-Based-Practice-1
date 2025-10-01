extends Node2D
class_name WeaponRifle

@export var fire_interval := 0.2
@export var damage := 70
var fire_timer := fire_interval
var rifle_projectile = preload("res://Scenes/projectile_rifle.tscn")
var tree_current_scene
var player

func update(delta : float, closest_enemy) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += fire_interval
		fire_weapon(closest_enemy)

func fire_weapon(closest_enemy) -> void:
	print("weapon fire called")
	var projectile = rifle_projectile.instantiate()
	projectile.global_position = player.global_position
	if closest_enemy:
		projectile.rotation = (closest_enemy.global_position - player.global_position).angle()
	else:
		projectile.rotation = 0.0
	tree_current_scene.add_child(projectile)
	#Todo : Implement auto-aim at closest enemy
