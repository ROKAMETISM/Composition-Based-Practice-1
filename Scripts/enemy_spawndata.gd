extends Node

var enemy_spawn_intervals : Dictionary

func _ready() -> void:
	enemy_spawn_intervals[preload("res://Scenes/enemy_slow.tscn")] = 2.0

func get_spawn_interval(enemy_type) -> float:
	return enemy_spawn_intervals[enemy_type]
