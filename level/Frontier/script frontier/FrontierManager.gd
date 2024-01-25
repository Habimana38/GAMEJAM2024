extends StaticBody2D

@onready var timeUntilFirstFrontier : Timer = $TimeUntilFirstFrontier
@onready var timeUntilNextFrontier : Timer = $TimeUntilNextFrontier
@onready var timeOfFrontier : Timer = $TimeOfFrontier
@export var gamemanager : GameManager

var currentfrontier : Node
@export var frontiers : Array[PackedScene]

func _begin():
	timeUntilFirstFrontier.start()
 

func _on_time_until_frontier_timeout():
	print("debut frontier")
	timeOfFrontier.start()
	if currentfrontier != null:
		currentfrontier.queue_free()

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

func _stop():
	timeUntilFirstFrontier.stop()
	timeUntilNextFrontier.stop()
	timeOfFrontier.stop()


func _on_game_manager_on_player_score():
	if(currentfrontier != null):
		currentfrontier.queue_free()
	
	_stop()
