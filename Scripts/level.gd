extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.global_position = get_viewport().size/2
	$EnemySpawner.player = player
	$EnemySpawner.enemies.append(preload("res://Scenes/enemy_slow.tscn"))
	$EnemySpawner.init_timers()
	
