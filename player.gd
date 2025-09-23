extends CharacterBody2D

@export var speed := 200.0

func _process(delta: float) -> void:
	var input_vector = Vector2(int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
								int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")))
	velocity = input_vector.normalized() * speed
