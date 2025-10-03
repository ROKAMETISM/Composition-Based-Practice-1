extends CharacterBody2D

@export var speed := 200.0
@export var player_initial_hp := 100
@export var player_max_hp := player_initial_hp
@export var player_current_hp := player_max_hp
var current_xp := 0
var level := 1
var xp_for_next_level := 5

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(player_max_hp)
	hpcomponent.set_current_hp(player_current_hp)

func _process(delta: float) -> void:
	var input_vector = Vector2(int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), 
								int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")))
	velocity = input_vector.normalized() * speed
	move_and_slide()

func add_xp(xp_amount : int) -> void:
	print("xp changed : {current_xp} + {addxp}".format({"current_xp" : current_xp, "addxp" : xp_amount}))
	current_xp += xp_amount
	while current_xp >= xp_for_next_level:
		current_xp -= xp_for_next_level
		level_up()
		xp_for_next_level += 1

func level_up() -> void:
	level += 1
	print("Level up! current level : {lvl}".format({"lvl" : level}))
