extends Control

@export var upgrade_card_scene = preload("uid://cyorv468553vi")

@onready var card_container = $HBoxContainer

func _ready():
	visible = false  # hidden by default until level-up happens
