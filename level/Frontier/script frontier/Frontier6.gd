extends Area2D

@export var force : float 

func _on_body_entered(body):
	if body is Ball:
		var force = (body as Ball).linear_velocity.normalized() * force;
		body.apply_impulse(force)
