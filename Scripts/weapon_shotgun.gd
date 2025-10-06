extends Node2D
class_name WeaponShotgun

var weapon_name = "Shotgun"
@export var base_fire_interval := 2.0
@export var base_projectile_damage := 30
var fire_timer := base_fire_interval
const SHOTGUN_PROJECTILE = preload("res://Scenes/projectile_shotgun.tscn")
var base_projectile_speed := 300.0
var base_pellets := 5
var spread_angle := deg_to_rad(10.0)
var tree_current_scene
var player

var upgrades = {"Fire Rate" : 0, "Damage" : 0, "Projectile Speed" : 0, "Pellets" : 0}

func update(delta : float, closest_enemy) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += base_fire_interval / (1 + upgrades["Fire Rate"] * 0.3)
		fire_weapon(closest_enemy)

func fire_weapon(closest_enemy) -> void:
	var aim
	var pellets = base_pellets + upgrades["Pellets"]
	var projectile_speed = base_projectile_speed * (1 + upgrades["Projectile Speed"] * 0.4)
	var projectile_damage = base_projectile_damage * (1 + upgrades["Damage"] * 0.5)
	
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
