extends KinematicBody2D

export var speed = 500
var velocity = Vector2()

func start(pos, direction):
	if direction == -1:
		$Apparence.flip_h = true
		$CollisionShape2D.position.x = -1
	else:
		$Apparence.flip_h = false
		$CollisionShape2D.position.x = 5
	position = pos 
	velocity = Vector2(speed * direction, 0)
	
func  _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(34)
		queue_free()
		

	
