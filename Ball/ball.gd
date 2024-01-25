extends RigidBody2D
class_name Ball

@export var air_friction : float

func _physics_process(delta):
	apply_friction(air_friction * delta)
	

func apply_friction(amount):
	if linear_velocity.length() > amount:
		apply_force(-linear_velocity.normalized() * amount)
	else:
		set_axis_velocity(Vector2.ZERO)
	


func _on_body_entered(body : Node):
	if(body.is_in_group("Player")):
		if body is Player: 
			var player = body as Player;
			var force = player.velocity * .5;
			apply_impulse(force)
			
	
			
func _move_to(position:Vector2):
	freeze = true
	sleeping = true
	global_position = position
	set_axis_velocity(Vector2.ZERO)
	freeze = false
	sleeping = true
