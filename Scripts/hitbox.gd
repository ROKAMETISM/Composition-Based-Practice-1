extends Area2D



func _on_body_entered(body: Node2D) -> void:
	#detected a Player hit by this Enemy's Hitbox
	if body == null:
		return
	if body != get_parent().player:
		return
	var hpcomponent = body.get_node_or_null("HPComponent")
	if hpcomponent:
		hpcomponent.take_damage(get_parent().enemy_damage)
		get_parent().queue_free()
