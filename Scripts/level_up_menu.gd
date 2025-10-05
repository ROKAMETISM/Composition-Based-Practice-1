extends Control

@export var upgrade_card_scene = preload("uid://cyorv468553vi")

@onready var card_container = $HBoxContainer


func show_upgrades(upgrade_choices: Array):
	# Clear any existing cards
	for c in card_container.get_children():
		c.queue_free()

	# Spawn new cards
	var i := 0
	for choice in upgrade_choices:
		var card = upgrade_card_scene.instantiate()
		card.set_upgrade_data(i, choice)  # a function you define in UpgradeCard.gd
		card_container.add_child(card)
		i += 1
	get_tree().paused = true  # optional pause
