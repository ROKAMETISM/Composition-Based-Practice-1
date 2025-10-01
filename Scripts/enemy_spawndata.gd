extends Node

var enemy_spawn_intervals : Dictionary
var enemy_spawn_distance_range : Dictionary

const enemy_slow = preload("res://Scenes/enemy_slow.tscn")

func _ready() -> void:
	enemy_spawn_intervals[enemy_slow] = 1.0
	enemy_spawn_distance_range[enemy_slow] = Vector2(200, 400)

func get_spawn_interval(enemy_type) -> float:
	return enemy_spawn_intervals[enemy_type]

func get_spawn_distance_range(enemy_type) -> Vector2:
	return enemy_spawn_distance_range[enemy_type]
