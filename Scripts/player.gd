extends CharacterBody2D

@export var speed := 200.0
@export var player_initial_hp := 100
@export var player_max_hp := player_initial_hp
var current_xp := 0
var level := 1
var xp_for_next_level := 5

signal player_hp_changed(new_hp, hp_max)
signal player_xp_changed(new_xp, xp_max)
signal player_level_changed(new_level)
signal upgrade_choices(upgrades : Array)
signal game_over

func _ready() -> void:
	var hpcomponent = $HPComponent
	hpcomponent.set_max_hp(player_max_hp)
	hpcomponent.set_current_hp(player_max_hp)
	hpcomponent.connect("current_hp_changed", hp_updated)
	hpcomponent.connect("died", _on_died)
	player_xp_changed.emit(current_xp, xp_for_next_level)
	player_hp_changed.emit(player_max_hp, player_max_hp)
	player_level_changed.emit(level)
	
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
	player_xp_changed.emit(current_xp, xp_for_next_level)

func level_up() -> void:
	level += 1
	player_level_changed.emit(level)
	xp_for_next_level += 1
	print("Level up! current level : {lvl}".format({"lvl" : level}))
	var copy = $WeaponManager.available_upgrades.duplicate()
	copy.shuffle()
	var picked_upgrades = copy.slice(0, 3)
	print("picked upgrades : " + str(picked_upgrades))
	upgrade_choices.emit(picked_upgrades)
	
func hp_updated(current_hp, hp_delta) -> void:
	player_hp_changed.emit(current_hp, player_max_hp)

func apply_upgrade(upgrade_data) -> void:
	upgrade_data[0].upgrades[upgrade_data[1]] += 1
	print(str(upgrade_data[0].upgrades))

func _on_died() -> void:
	game_over.emit()
