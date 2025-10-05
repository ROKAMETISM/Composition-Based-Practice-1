extends Control

var inst_LevelUpMenu
const LEVELUPMENU = preload("uid://dknot45ve4a62")

func create_level_up(picked_upgrades : Array) -> void:
	inst_LevelUpMenu = LEVELUPMENU.instantiate()
	add_child(inst_LevelUpMenu)
	inst_LevelUpMenu.show_upgrades(picked_upgrades)
