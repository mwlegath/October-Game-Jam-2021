extends KinematicBody2D

# Physics 
var speed : int = 200 
var jumpForce : int = 450
var gravity : int = 800
var vel : Vector2 = Vector2()
var grounded : bool = false

# components 
onready var sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	# reset horizontal velocity 
	vel.x = 0
	
	# movement 
	if Input.is_action_pressed("move_left"):
		vel.x -= speed 
	if Input.is_action_pressed("move_right"):
		vel.x += speed 
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	# applying velocity 
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity 
	vel.y += gravity * delta
	
	# sprite animation move right
	if Input.is_action_pressed("move_right"):
		sprite.play("run") 
	else:
		sprite.play("idle")
	if Input.is_action_pressed("move_left"):
		sprite.play("run")
	else:
		sprite.play("idle")
		
	

		
