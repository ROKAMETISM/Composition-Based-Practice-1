extends Node2D
var enemies : Array
var enemy_timers : Array
@export var spawn_enemies := true
var player



func init_timers() -> void:
	for enemy_type in enemies:
		var timer = Timer.new()
		timer.wait_time = enemy_type.spawn_interval
		add_child(timer)
		enemy_timers.append(timer)
		timer.start()

func _on_timer_timeout(enemy_type_index) -> void:
	var enemy = enemies[enemy_type_index].instantiate()
	var player_pos = player.global_position
	var rand_vec = Vector2(randi_range(100, 200), 0).rotated(randf_range(0, 2*PI))
	enemy.global_position = player_pos + rand_vec
	get_parent().add_child(enemy)
	enemy.visualize()
