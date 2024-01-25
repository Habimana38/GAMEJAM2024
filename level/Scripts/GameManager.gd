extends Node

class_name GameManager

static var Instance : GameManager

@export var player1_scene: PackedScene
@export var player2_scene: PackedScene
@export var ball_scene: PackedScene

@export var player1_spawn : Node2D
@export var player2_spawn : Node2D
@export var ball_spawn : Node2D

@export var player1Score : int = 0
@export var player2Score : int = 0
@export var timer : Timer

var has_game_started : bool

signal on_game_ends
signal on_game_init
signal on_game_starts
signal on_player_score

var player1
var player2
var ball : Ball

# Called when the node enters the scene tree for the first time.
func _ready():
	Instance = self
	player1Score = 0
	player2Score = 0
	_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	on_game_ends.emit()
	has_game_started = false

func _spawn():
	
	
	player1 = player1_scene.instantiate()
	add_child(player1)
	player1.set_position(player1_spawn.global_position)
	
	player2 = player2_scene.instantiate()
	add_child(player2)
	player2.set_position(player2_spawn.global_position)
	
	_spawn_ball()
	on_game_init.emit()
	
func _add_point_player1():
	player1Score += 1
	on_player_score.emit()
	has_game_started = false

func _add_point_player2():
	player2Score += 1
	on_player_score.emit()
	has_game_started = false
	
func _restart():
	ball.queue_free()
	player1.global_position = player1_spawn.global_position
	player2.global_position = player2_spawn.global_position
	_spawn_ball()
	timer.paused = true
	on_game_init.emit()

func _spawn_ball():
	ball = ball_scene.instantiate()
	ball.set_position(ball_spawn.global_position)
	add_child(ball)

func _start_game():
	has_game_started = true
	on_game_starts.emit()
	if timer.is_stopped():
		timer.start()
	timer.paused = false

