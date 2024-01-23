extends Label

@export var gm : GameManager

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(gm.timer.time_left as int)
