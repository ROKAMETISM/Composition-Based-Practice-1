extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area:
		area.is_following = true
	
