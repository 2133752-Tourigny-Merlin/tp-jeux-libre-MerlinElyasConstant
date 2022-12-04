extends KinematicBody2D

export var speed = 500
var velocity = Vector2()

func start(pos, direction):
	position = pos 
	velocity = Vector2(speed * direction, 0)
	
func  _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(20)
		queue_free()
		

	
