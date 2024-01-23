extends Node

class_name GameManager

@export var player1_scene: PackedScene
@export var player2_scene: PackedScene
@export var ball_scene: PackedScene

@export var player1_spawn : Node2D
@export var player2_spawn : Node2D
@export var ball_spawn : Node2D

@export var player1Score : int = 0
@export var player2Score : int = 0
@export var timer : Timer

var player1
var player2
var ball : Ball

# Called when the node enters the scene tree for the first time.
func _ready():
	player1Score = 0
	player2Score = 0
	_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print("Game over")

func _spawn():
	print("Test spawn 1")
	
	player1 = player1_scene.instantiate()
	add_child(player1)
	player1.set_position(player1_spawn.global_position)
	
	player2 = player2_scene.instantiate()
	add_child(player2)
	player2.set_position(player2_spawn.global_position)
	
	_spawn_ball()
	
func _add_point_player1():
	player1Score += 1

func _add_point_player2():
	player2Score += 1

func _restart():
	ball.queue_free()
	player1.global_position = player1_spawn.global_position
	player2.global_position = player2_spawn.global_position
	_spawn_ball()

func _spawn_ball():
	ball = ball_scene.instantiate()
	ball.set_position(ball_spawn.global_position)
	add_child(ball)
