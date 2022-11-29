extends KinematicBody2D


onready var _animated_sprite = get_node("Apparence")

const GRAVITY = 400
const WALK_SPEED = 100
const JUMP_FORCE = 400

var velocity = Vector2()


func _physics_process(delta):
	velocity.y += 0.05 * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		_animated_sprite.play("CourirArme")
	else:
		# smoothen the stop
		velocity.x = lerp(velocity.x, 0, 0.1)

	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_FORCE
		_animated_sprite.play("SauterArme")
		
		
	velocity = move_and_slide(velocity, Vector2.UP)
