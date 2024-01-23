extends Node

class_name GameManager

@export var Player1Score : int = 0
@export var Player2Score : int = 0
@export var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Player1Score = 0
	Player2Score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print("Game over")
