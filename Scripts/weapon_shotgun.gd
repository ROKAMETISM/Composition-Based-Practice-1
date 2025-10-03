extends Node2D
class_name WeaponShotgun

var weapon_name = "Shotgun"
@export var fire_interval := 0.8
@export var projectile_damage := 40
var fire_timer := fire_interval
const SHOTGUN_PROJECTILE = preload("res://Scenes/projectile_shotgun.tscn")
var projectile_speed := 500.0
var pellets := 10
var spread_angle := deg_to_rad(10.0)
var tree_current_scene
var player

var upgrades = {"Fire Rate" : 0, "Damage" : 0, "Projectile Speed" : 0, "Pellets" : 0}

func update(delta : float, closest_enemy) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += fire_interval
		fire_weapon(closest_enemy)

func fire_weapon(closest_enemy) -> void:
	var aim
	
	if closest_enemy:
		aim = (closest_enemy.global_position - player.global_position).angle()
	else:
		aim = randf_range(0.0, 2*PI)
	for i in range(0, pellets):
		var projectile = SHOTGUN_PROJECTILE.instantiate()
		projectile.global_position = player.global_position
		projectile.speed = projectile_speed
		projectile.set_damage(projectile_damage)
		projectile.rotation = aim - spread_angle + 2 * spread_angle * i / (pellets-1)
		tree_current_scene.add_child(projectile)
	#Todo : Implement auto-aim at closest enemy
