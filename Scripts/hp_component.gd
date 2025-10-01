extends Node
class_name HPComponent

var max_hp := 100
var current_hp := 100

func set_max_hp(hp : int) -> void:
	max_hp = hp

func set_current_hp(hp : int) -> void:
	current_hp = hp
	
func take_damage(damage : int) -> void:
	current_hp -= damage
	
