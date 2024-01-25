extends Control

class_name StartCount

func _start_count():
	$AnimationPlayer.play("321")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "321":
		GameManager.Instance._start_game()
