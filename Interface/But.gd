extends Control

func _ready():
	visible = false

func _on_game_manager_on_player_score():
	$AnimationPlayer.play("Goal")
	visible = true


func _on_animation_player_animation_finished(anim_name):
	visible = false
	GameManager.Instance._restart()
