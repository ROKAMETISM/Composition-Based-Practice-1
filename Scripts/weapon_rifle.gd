extends Node2D
class_name WeaponRifle

var weapon_name = "Rifle"
@export var fire_interval := 0.2
var fire_timer := fire_interval
const rifle_projectile = preload("res://Scenes/projectile_rifle.tscn")
var projectile_speed := 600.0
@export var projectile_damage := 70
var tree_current_scene
var player

var upgrades = {"Fire Rate" : 0, "Damage" : 0, "Projectile Speed" : 0}

func update(delta : float, closest_enemy) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += fire_interval
		fire_weapon(closest_enemy)

func fire_weapon(closest_enemy) -> void:
	var projectile = rifle_projectile.instantiate()
	projectile.global_position = player.global_position
	projectile.speed = projectile_speed
	projectile.set_damage(projectile_damage)
	if closest_enemy:
		projectile.rotation = (closest_enemy.global_position - player.global_position).angle()
	else:
		projectile.rotation = randf_range(0.0, 2*PI)
	tree_current_scene.add_child(projectile)
	#Todo : Implement auto-aim at closest enemy
