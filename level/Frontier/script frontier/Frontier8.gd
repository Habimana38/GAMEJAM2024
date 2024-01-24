extends StaticBody2D

@export var walls : Array [CollisionShape2D]
@export var enableColor : Color
@export var disableColor : Color

func _ready():
	_on_timer_timeout()

func _on_timer_timeout():
	print("Debut de fonction")
	for n in walls:
		var enable = randf() > 0.5
		if enable :
			print("enable")
			n.disabled = false
			var node = n.get_node("Polygon2D") as Polygon2D
			if node != null:
				node.color = enableColor
			
		else :
			print("disable")
			n.disabled = true
			var node = n.get_node("Polygon2D")
			if node is Polygon2D:
				(node as Polygon2D).color = disableColor
			
		
