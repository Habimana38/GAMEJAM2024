extends StaticBody2D

@onready var timeUntilFirstFrontier : Timer = $TimeUntilFirstFrontier
@onready var timeUntilNextFrontier : Timer = $TimeUntilNextFrontier
@onready var timeOfFrontier : Timer = $TimeOfFrontier

var currentfrontier : Node
@export var frontiers : Array[PackedScene]

func _ready():
	_begin()

func _begin():
	timeUntilFirstFrontier.start()
 

func _on_time_until_frontier_timeout():
	print("debut frontier")
	timeOfFrontier.start()
	currentfrontier = _get_random()
	print("Spawned frontier : " + currentfrontier.name)
	add_child(currentfrontier)
	currentfrontier.position=Vector2.ZERO
	
func _on_time_of_frontier_timeout():
	print("fin frontier")
	timeUntilNextFrontier.start()
	if(currentfrontier != null):
		currentfrontier.queue_free()


func _get_random() -> Node:
	var item = frontiers[randi() % frontiers.size()]
	return item.instantiate()

func _restart():
	timeUntilFirstFrontier.stop()
	timeUntilNextFrontier.stop()
	timeOfFrontier.stop()
	_begin()


func _on_game_manager_on_player_score():
	print("aaaaaaaaaaaaaaaaaaaa")
	_restart()
	if(currentfrontier != null):
		currentfrontier.queue_free()
