extends VBoxContainer

@export var country_image : TextureRect
@export var player_name : Label
@export var isplayer1 : bool
@export var character_selection : CharacterSelection

var index : int

func _ready():
	refresh_index()

func _on_next_pressed():
	index += 1
	if index >= character_selection.flags.size() :
		index = 0
	refresh_index()


func _on_previous_pressed():
	index -= 1
	if index <= 0 :
		index = character_selection.flags.size() - 1 
	refresh_index()

		
func refresh_index():
	country_image.texture = character_selection.charactercountry[index]
	if isplayer1 :
		player_name.text = "Player 1"
		GlobalPlayer.player1texture = character_selection.flags[index]
		GlobalPlayer.player1country = character_selection.flags[index].resource_name
	else : 
		player_name.text = "Player 2"
		GlobalPlayer.player2texture = character_selection.flags[index]
		GlobalPlayer.player2country = character_selection.flags[index].resource_name
