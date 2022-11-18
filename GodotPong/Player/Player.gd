extends KinematicBody2D

export var speed = 400 

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	move_and_slide(velocity * speed)

# Screen Boundries
	var viewRect := get_viewport_rect()
	position.y = clamp(position.y, 0, viewRect.size.y)
