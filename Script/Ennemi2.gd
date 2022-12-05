extends KinematicBody2D


const GRAVITY = 600
const WALK_SPEED = 100
const JUMP_FORCE = 600
onready var _animated_sprite = $Apparence
var velocity = Vector2()
var life = 100
var is_dead = false
var moving_left = true

func _physics_process(delta):
	detect_turn_around()
	if is_dead == false:
		_animated_sprite.play("Marche")
		if moving_left:
			velocity.x = -WALK_SPEED
			$Apparence.scale.x = 1
			$RayCast2D.position.x = -9
			$RayCast2D.position.y = -6
		else:
			velocity.x = WALK_SPEED
			$Apparence.scale.x = -1
			$RayCast2D.position.x = 9
			$RayCast2D.position.y = -8
			
		velocity.y += 0.05 * GRAVITY

		velocity = move_and_slide(velocity, Vector2.UP)
#	if is_dead:
#		print("test")
#		queue_free()
		

func  hit(damage):
	life -= damage
	if life <= 0:
		dead()

func _on_Timer_timeout():
	queue_free()
	
func dead(): 
	is_dead = true
	velocity = Vector2.ZERO
	_animated_sprite.play("Mort")
	$CollisionShape2D.disabled = true
	$BloodSplash0.visible = true
	$Timer.start()
	
func detect_turn_around():
	if $RayCast2D.is_colliding():
		if moving_left:
			moving_left = false
		else:
			moving_left = true

	
	
