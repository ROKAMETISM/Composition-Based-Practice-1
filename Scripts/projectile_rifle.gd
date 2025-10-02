extends Area2D

@export var speed := 1.0

func _process(delta: float) -> void:
	var velocity := Vector2(speed, 0.0).rotated(rotation)
	global_position += velocity * delta

func set_damage(new_damage : int) -> void:
	$DamageComponent.set_damage(new_damage)

func _on_body_entered(body: Node2D) -> void:
	#detected an Enemy hit by this projectile.
	if body == null:
		return
	if !body.is_in_group("Enemies"):
		return
	var hpcomponent = body.get_node_or_null("HPComponent")
	if hpcomponent:
		hpcomponent.take_damage($DamageComponent.get_damage())
		queue_free()
