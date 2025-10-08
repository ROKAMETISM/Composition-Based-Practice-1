extends Control

var inst_LevelUpMenu
const LEVELUPMENU = preload("uid://dknot45ve4a62")
const GAMEOVERMENU = preload("uid://dknot45ve4a62")

func create_level_up(picked_upgrades : Array) -> void:
	inst_LevelUpMenu = LEVELUPMENU.instantiate()
	add_child(inst_LevelUpMenu)
	inst_LevelUpMenu.show_upgrades(picked_upgrades)
	inst_LevelUpMenu.upgrade_chosen.connect(get_tree().current_scene.player.apply_upgrade)

func create_game_over() -> void:
	var inst_GameOverMenu = GAMEOVERMENU.instantiate()
	add_child(inst_GameOverMenu)
