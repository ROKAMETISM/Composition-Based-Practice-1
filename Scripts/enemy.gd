extends CharacterBody2D

@export var enemy_initial_hp := 100
@export var enemy_max_hp := enemy_initial_hp
@export var enemy_current_hp := enemy_max_hp

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(enemy_max_hp)
	hpcomponent.set_current_hp(enemy_current_hp)

func _process(delta: float) -> void:
	move_and_slide()
