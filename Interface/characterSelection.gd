extends Control

class_name CharacterSelection

@export var flags : Array[Texture]
@export var charactercountry : Array[Texture]


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
