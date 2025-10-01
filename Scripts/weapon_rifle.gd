extends Node2D
class_name WeaponRifle

@export var fire_interval := 0.2
@export var damage := 70
var fire_timer := fire_interval
var rifle_projectile = preload("res://Scenes/projectile_rifle.tscn")
var tree_current_scene
var player

func update(delta : float) -> void:
	fire_timer -= delta
	if fire_timer < 0 :
		fire_timer += fire_interval
		fire_weapon()

func fire_weapon() -> void:
	print("weapon fire called")
	var projectile = rifle_projectile.instantiate()
	projectile.global_position = player.global_position
	projectile.rotation = player.rotation
	tree_current_scene.add_child(projectile)
