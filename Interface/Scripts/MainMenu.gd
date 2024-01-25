extends Control

func _ready():
	$AudioStreamPlayer2D.play()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Interface/characterSelection.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_option_pressed():
	get_tree().change_scene_to_file("res://Interface/Option.tscn")
