extends Area2D

@export var is_player1 : bool
@export var gamemanager : GameManager


func _on_body_entered(body):
	if body is Ball:
		if is_player1 : 
			gamemanager._add_point_player2()
		else:
			gamemanager._add_point_player1()
		
