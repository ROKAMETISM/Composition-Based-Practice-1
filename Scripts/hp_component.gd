extends Node
class_name HPComponent

signal current_hp_changed(new_current_hp, hp_delta)
signal max_hp_changed(new_max_hp, hp_delta)
signal died


var max_hp := 100
var current_hp := 100

func set_max_hp(hp : int) -> void:
	var hp_delta = hp - max_hp
	max_hp = hp
	emit_signal("max_hp_changed", max_hp, hp_delta)

func set_current_hp(hp : int) -> void:
	var hp_delta = hp - current_hp
	current_hp = hp
	emit_signal("current_hp_changed", current_hp, hp_delta)
	
func take_damage(damage : int) -> void:
	current_hp -= damage
	emit_signal("current_hp_changed", current_hp, -damage)
	if current_hp <= 0:
		emit_signal("died")
