extends KinematicBody2D


const GRAVITY = 120
const WALK_SPEED = 60

onready var _animated_sprite = $Apparence
var velocity = Vector2()
var life = 100
var is_dead = false
var moving_left = true

var ennemi1Tuer = 0

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
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision:
				if collision.collider.has_method("touche"):
					collision.collider.touche()
					$BloodSplash0.visible = true
					queue_free()
			
#	if is_dead:
#		print("test")
#		queue_free()
		

func  hit(damage):
	life -= damage
	if life <= 0:
		dead()

func _on_Timer_timeout():
	$BloodSplash0.visible = true
	
func dead(): 
	is_dead = true
	velocity = Vector2.ZERO
	_animated_sprite.play("Mort")
	$CollisionShape2D.disabled = true
	ennemi1Tuer = ennemi1Tuer+1
	print(ennemi1Tuer)
	$Timer.start()
	
func detect_turn_around():
	if $RayCast2D.is_colliding():
		if moving_left:
			moving_left = false
		else:
			moving_left = true
