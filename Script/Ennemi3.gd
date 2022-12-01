extends KinematicBody2D


var GRAVITY = 0.8

onready var _animated_sprite = $Apparence
var velocity = Vector2()
var index = 0;
func _physics_process(delta):
	if GRAVITY > 0:
		velocity.y += 0.05 * GRAVITY
		_animated_sprite.play("Mort");
		_animated_sprite.scale.x = -1
	
	if move_and_collide(velocity) != null:
		_animated_sprite.visible = false
		$BloodSplash0.visible = true
		$CollisionShape2D.disabled = true
		GRAVITY = 0
		velocity.y = 0

