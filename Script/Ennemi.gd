extends KinematicBody2D


const GRAVITY = 100
const WALK_SPEED = 50
const JUMP_FORCE = 600
onready var _animated_sprite = $Apparence
var velocity = Vector2()
var life = 100

func _physics_process(delta):
	velocity.y += 0.05 * GRAVITY
	velocity.x = -WALK_SPEED
	_animated_sprite.play("Marche");
	_animated_sprite.scale.x = -1
	velocity = move_and_slide(velocity, Vector2.UP)

func hit(damage):
	life -= damage
	if life <= 0:
		queue_free()
