extends KinematicBody2D

var velocity = Vector2()

onready var sprite = $AnimatedSprite

# 1 is right, -1 is left
export var direction = -1
export var detects_cliffs = true




func _ready():
	if direction == -1:
		sprite.set_flip_h(true)
	else:
		sprite.set_flip_h(false)
	sprite.play("Walk")
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	
	
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1 
		sprite.flip_h = not sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	# += means to add to variable
	velocity.y += 20
	
	velocity.x = 50 * direction 
	
	velocity = move_and_slide(velocity,Vector2.UP)
