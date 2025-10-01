extends Node2D

var weapons : Array

func _ready() -> void:
	weapons.append(preload("res://Scripts/weapon_rifle.gd").new())
	
	for weapon in weapons:
		weapon.tree_current_scene = get_tree().current_scene
		weapon.player = get_parent()
	
func _process(delta: float) -> void:
	for weapon in weapons:
		weapon.update(delta)
