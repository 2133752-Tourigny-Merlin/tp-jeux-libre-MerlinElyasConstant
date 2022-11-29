extends KinematicBody2D


const GRAVITY = 50

onready var _animated_sprite = $Apparence
var velocity = Vector2()

func _physics_process(delta):
	velocity.y += 0.05 * GRAVITY
	_animated_sprite.play("Mort");
	_animated_sprite.scale.x = -1
	
	velocity = move_and_slide(velocity, Vector2.UP)
