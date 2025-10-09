extends Node2D

@onready var player = $Level/Player
@onready var hud = $UI/HUD
@onready var menu = $UI/Menu
@onready var joystick = $UI/Joystick

func _ready():
	player.player_hp_changed.connect(hud.update_hp)
	player.player_xp_changed.connect(hud.update_xp)
	player.player_level_changed.connect(hud.update_level)
	player.upgrade_choices.connect(menu.create_level_up)
	player.game_over.connect(menu.create_game_over)
	joystick.joystick_is_pressing.connect(player.set_joystick_pressing)
	joystick.joystick_angle.connect(player.set_joystick_angle)
