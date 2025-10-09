extends Button

var index : int

func set_upgrade_data(new_index, upgrade_data) -> void:
	index = new_index
	text = upgrade_data[0].weapon_name + "\n" + upgrade_data[1]
