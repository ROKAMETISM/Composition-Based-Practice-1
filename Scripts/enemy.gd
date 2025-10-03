@abstract extends CharacterBody2D

@export var enemy_initial_hp := 100
@export var enemy_max_hp := enemy_initial_hp
@export var enemy_current_hp := enemy_max_hp
var player

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(enemy_max_hp)
	hpcomponent.set_current_hp(enemy_current_hp)
	hpcomponent.connect("died", _on_died)
	collision_layer = 2 
	collision_mask = 1

func _process(delta: float) -> void:
	enemy_ai()
	move_and_slide()

func _on_died() -> void:
	queue_free()

@abstract func enemy_ai() -> void
