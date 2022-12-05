extends KinematicBody2D


const GRAVITY = 600
const WALK_SPEED = 100
const JUMP_FORCE = 600
onready var _animated_sprite = $Apparence
var velocity = Vector2()
var life = 100
var is_dead = false


func _physics_process(delta):
	
	if is_dead == false:
		velocity.y += 0.05 * GRAVITY
		velocity.x = WALK_SPEED
		_animated_sprite.play("Marche")
		_animated_sprite.scale.x = 1
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
	$Timer.start()
	


func _on_Area2D_area_entered(area):
	print(area)
