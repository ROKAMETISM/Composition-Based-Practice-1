extends Control
@onready var base = $Base
@onready var knob = $Knob
var pressing := false
var relative_pointer_position := Vector2.ZERO
func _process(delta: float) -> void:
	if pressing:
		relative_pointer_position = get_global_mouse_position() - global_position
		
func _on_base_button_down() -> void:
	pressing = true
func _on_base_button_up() -> void:
	pressing = false
