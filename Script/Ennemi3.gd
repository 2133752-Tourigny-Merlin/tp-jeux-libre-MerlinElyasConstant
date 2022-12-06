extends KinematicBody2D


var GRAVITY = 80

onready var _animated_sprite = $Apparence
var velocity = Vector2()
var index = 0;

var ennemi3Tuer = 0

func _physics_process(delta):
	if GRAVITY > 0:
		velocity.y += 0.05 * GRAVITY
		_animated_sprite.play("Mort");
		_animated_sprite.scale.x = -1
	
		velocity = move_and_slide(velocity, Vector2.UP)
		var collision = ""
		for i in get_slide_count():
			collision = get_slide_collision(i)
			if collision:
				ennemi3Tuer = ennemi3Tuer+1
				GRAVITY = 0
				velocity.y = 0
				$BloodSplash0.visible = true
				$CollisionShape2D.disabled = true
				if collision.collider.has_method("touche"):
					collision.collider.touche()
					queue_free()

