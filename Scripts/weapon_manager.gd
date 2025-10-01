extends Node2D

var weapons : Array

func _ready() -> void:
	weapons.append(preload("res://Scripts/weapon_rifle.gd").new())
	
func _process(delta: float) -> void:
	for weapon in weapons:
		weapon.update(delta)
