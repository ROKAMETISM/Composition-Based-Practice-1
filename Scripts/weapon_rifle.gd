extends Node2D
class_name WeaponRifle

var weapon_name = "Rifle"
@export var base_fire_interval := 1.0
var fire_timer := base_fire_interval
const rifle_projectile = preload("res://Scenes/projectile_rifle.tscn")
var base_projectile_speed := 400.0
@export var base_projectile_damage := 40
var tree_current_scene
var player

var upgrades = {"Fire Rate" : 0, "Damage" : 0, "Projectile Speed" : 0}

func update(delta : float, closest_enemy) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += base_fire_interval / (1 + upgrades["Fire Rate"] * 0.4)
		fire_weapon(closest_enemy)

func fire_weapon(closest_enemy) -> void:
	var projectile = rifle_projectile.instantiate()
	projectile.global_position = player.global_position
	projectile.speed = base_projectile_speed * (1 + upgrades["Projectile Speed"] * 0.5)
	projectile.set_damage(base_projectile_damage * (1 + upgrades["Damage"] * 0.4))
	if closest_enemy:
		projectile.rotation = (closest_enemy.global_position - player.global_position).angle()
	else:
		projectile.rotation = randf_range(0.0, 2*PI)
	tree_current_scene.add_child(projectile)
	#Todo : Implement auto-aim at closest enemy
