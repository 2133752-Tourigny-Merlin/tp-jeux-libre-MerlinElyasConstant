extends KinematicBody2D

export var speed = 500
var velocity = Vector2()

func start(pos, direction):
	position = pos 
	velocity = Vector2(speed * direction, 0)
	
func  _process(delta):
	var collision = move_and_slide(velocity)

func destroy(): 
	queue_free()
	
