extends CanvasLayer

@export var gamemanager : GameManager
@export var playerscore : Label

func _ready():
	visible = false


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Interface/MainMenu.tscn")


func _on_game_manager_on_game_ends():
	visible = true
	playerscore.text = str(gamemanager.player1Score) + " - " + str(gamemanager.player2Score)

