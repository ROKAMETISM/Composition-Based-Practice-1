extends Node2D

@onready var player = $Level/Player
@onready var hud = $UI/HUD

func _ready():
	player.player_hp_changed.connect(hud.update_hp)
	player.player_xp_changed.connect(hud.update_xp)
	player.player_level_changed.connect(hud.update_level)
