extends Node2D
var enemies : Array
var enemy_timers : Array
@export var spawn_enemies := true
var player



func init_timers() -> void:
	for enemy_type in enemies:
		var timer = Timer.new()
		timer.wait_time = $EnemySpawndata.get_spawn_interval(enemy_type)
		timer.connect("timeout", _on_timer_timeout.bind(enemy_type))
		add_child(timer)
		enemy_timers.append(timer)
		timer.start()
		

func _on_timer_timeout(enemy_type) -> void:
	var enemy = enemy_type.instantiate()
	var player_pos = player.global_position
	var spawn_distance_range = $EnemySpawndata.get_spawn_distance_range(enemy_type)
	var rand_vec = Vector2(randi_range(spawn_distance_range.x, spawn_distance_range.y), 0).rotated(randf_range(0, 2*PI))
	enemy.player = player
	enemy.global_position = player_pos + rand_vec
	get_parent().add_child(enemy)
