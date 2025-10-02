extends Node
class_name DamageComponent


var damage := 100

func set_damage(new_damage : int) -> void:
	damage = new_damage

func get_damage() -> int:
	return damage
