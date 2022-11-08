extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
export var gravity = 3000
export var move_speed = 300
export var jump_speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("right"):
		velocity.x += move_speed
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
