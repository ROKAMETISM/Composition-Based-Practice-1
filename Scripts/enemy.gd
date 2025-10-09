@abstract extends CharacterBody2D

@export var enemy_initial_hp := 100
@export var enemy_max_hp := enemy_initial_hp
@export var enemy_current_hp := enemy_max_hp
@export var enemy_damage := 10
var player
const XPDROP = preload("uid://diqqkwgfjw1to")

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(enemy_max_hp)
	hpcomponent.set_current_hp(enemy_current_hp)
	hpcomponent.connect("died", _on_died)
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _process(delta: float) -> void:
	enemy_ai()
	move_and_slide()

func _on_died() -> void:
	var new_xp = XPDROP.instantiate()
	new_xp.global_position = global_position
	new_xp.player = player
	get_tree().current_scene.call_deferred("add_child", new_xp)
	queue_free()

@abstract func enemy_ai() -> void
