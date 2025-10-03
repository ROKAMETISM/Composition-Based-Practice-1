extends Area2D

@export var xp_amount := 1
var is_following := false
var velocity := Vector2.ZERO
var speed := 300.0
var player

func _process(delta: float) -> void:
	if is_following:
		if player:
			look_at(player.global_position)
			velocity = Vector2(speed, 0.0).rotated(rotation)
	position += velocity * delta
