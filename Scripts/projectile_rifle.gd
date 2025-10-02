extends Area2D

@export var speed := 1.0

func _process(delta: float) -> void:
	var velocity := Vector2(speed, 0.0).rotated(rotation)
	global_position += velocity * delta
