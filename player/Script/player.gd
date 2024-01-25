extends CharacterBody2D
class_name Player

var screen_size
var input : Vector2;

@export var maxSpeed = 300;
@export var acceleration = 100;
@export var friction = 50; 

@export var isplayer1 : bool
@export var move_up : String;
@export var move_down : String;
@export var move_left : String;
@export var move_right : String;


func _ready():
	screen_size = get_viewport_rect().size
	if isplayer1 :
		$Sprite2D.texture = GlobalPlayer.player1texture
	else : 
		$Sprite2D.texture = GlobalPlayer.player2texture

func _process(delta):
	
	input = Vector2.ZERO  

	if Input.is_action_pressed(move_right):
		input.x += 1
	if Input.is_action_pressed(move_left):
		input.x -= 1
	if Input.is_action_pressed(move_down):
		input.y += 1
	if Input.is_action_pressed(move_up):
		input.y -= 1
	

func _physics_process(delta):
	if GameManager.Instance.has_game_started == false:
		return
	
	if input.length_squared() == 0 :
		apply_friction(friction * delta)
	else :
		apply_acceleration(delta * acceleration * input.normalized())
		
	move_and_slide()


func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO
		
func apply_acceleration(accel):
	velocity += accel;
	velocity = velocity.limit_length(maxSpeed)


