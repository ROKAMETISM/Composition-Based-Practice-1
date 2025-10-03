extends Node

var enemy_spawn_intervals : Dictionary
var enemy_spawn_distance_range : Dictionary

const ENEMY_SLOW = preload("res://Scenes/enemy_slow.tscn")
const ENEMY_FAST = preload("res://Scenes/enemy_fast.tscn")

func _ready() -> void:
	enemy_spawn_intervals[ENEMY_SLOW] = 1.0
	enemy_spawn_distance_range[ENEMY_SLOW] = Vector2(200, 400)
	
	enemy_spawn_intervals[ENEMY_FAST] = 1.3
	enemy_spawn_distance_range[ENEMY_FAST] = Vector2(300, 600)
	

func get_spawn_interval(enemy_type) -> float:
	return enemy_spawn_intervals[enemy_type]

func get_spawn_distance_range(enemy_type) -> Vector2:
	return enemy_spawn_distance_range[enemy_type]
