extends CharacterBody2D

@export var speed := 200.0
@export var player_initial_hp := 100
@export var player_max_hp := player_initial_hp
@export var player_current_hp := player_max_hp

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.

func _process(delta: float) -> void:
	var input_vector = Vector2(int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
								int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")))
	velocity = input_vector.normalized() * speed
	move_and_slide()
