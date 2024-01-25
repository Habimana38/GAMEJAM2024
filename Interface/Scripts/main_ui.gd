extends CanvasLayer

@export var startcount : StartCount


func _on_game_manager_on_game_init():
	startcount._start_count()
