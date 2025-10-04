extends Control

func update_hp(new_hp, hp_max) -> void:
	$HPBar.value = new_hp
	$HPBar.max_value = hp_max

func update_xp(new_xp, xp_max) -> void:
	$XPBar.value = new_xp
	$XPBar.max_value = xp_max

func update_level(new_level) -> void:
	$LevelLabel.text = "Level : " + str(new_level)
