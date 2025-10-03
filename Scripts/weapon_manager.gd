extends Node2D

var weapons : Array

func _ready() -> void:
	weapons.append(preload("res://Scripts/weapon_rifle.gd").new())
	weapons.append(preload("res://Scripts/weapon_shotgun.gd").new())
	
	for weapon in weapons:
		weapon.tree_current_scene = get_tree().current_scene
		weapon.player = get_parent()
	
func _process(delta: float) -> void:
	var closest_enemy = get_closest_enemy()
	for weapon in weapons:
		weapon.update(delta, closest_enemy)

func get_closest_enemy() -> CharacterBody2D:
	var closest_enemy: CharacterBody2D = null
	var closest_distance := INF
	var player = get_parent()

	# Find all CharacterBody2D nodes
	for character in get_tree().get_nodes_in_group("Enemies"):
		if character == player:
			continue  # skip self

		var dist = player.global_position.distance_to(character.global_position)
		if dist < closest_distance:
			closest_distance = dist
			closest_enemy = character

	return closest_enemy
