extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.global_position = get_viewport().size/2
