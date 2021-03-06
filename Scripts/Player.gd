extends KinematicBody2D

# Physics 
var speed : int = 200 
var jumpForce : int = 450
var gravity : int = 750
var vel : Vector2 = Vector2()
var grounded : bool = false

# components 
onready var sprite = $AnimatedSprite
onready var ui = get_node("../CanvasLayer/UI")
var score : int = 0

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
	if position.y >= 650:
		die()
	
	# applying velocity 
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity 
	vel.y += gravity * delta
	
	# sprite animation move right
	if vel.x > 0:
		sprite.play("Walk") 
	elif vel.x < 0:
		sprite.play("Walk")
	else:
		sprite.play("Idle")
	
	if vel.y < 0:
		sprite.play("Jump")
		
	if Input.is_action_pressed("move_left"):
		sprite.set_flip_h(true)
	if Input.is_action_pressed("move_right"):
		sprite.set_flip_h(false)
		
	
func die ():
	get_tree().reload_current_scene()

func collect_coin (value):
	
	score += value
	ui.set_score_text(score)
	
	

		
