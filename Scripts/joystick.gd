extends Control
@onready var base = $Base
@onready var knob = $Knob
var pressing := false
var relative_pointer_position := Vector2.ZERO
var radius := 64.0
var angle := 0.0
signal joystick_is_pressing(pressing:bool)
signal joystick_angle(angle:float)
func _process(delta: float) -> void:
	if pressing:
		relative_pointer_position = get_global_mouse_position() - global_position
	else:
		relative_pointer_position = lerp(relative_pointer_position, Vector2.ZERO, delta*40)
	angle = relative_pointer_position.angle()
	if relative_pointer_position.length() > radius:
		relative_pointer_position = relative_pointer_position.normalized()*radius
	knob.position = relative_pointer_position - Vector2(radius, radius)
	joystick_is_pressing.emit(pressing)
	joystick_angle.emit(angle)
func _on_base_button_down() -> void:
	pressing = true
func _on_base_button_up() -> void:
	pressing = false
