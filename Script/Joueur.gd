extends KinematicBody2D

var GRAVITY = 1800
const UP = Vector2(0,-1)
const ACCEL = 10

onready var _animated_sprite = get_node("Apparence")


var vel = Vector2()
var jump_count = 0
var bullet = preload("res://Scene/Bullet.tscn")
var direction = 1
var vie = 3

var estMort = false

export(int) var max_speed = 200

func touche():
	vie -=1
	if vie <0:
		vie =0
	print(vie)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if vie == 3:
		estMort = false
	elif vie == 2:
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein3.visible = false
	elif vie == 1:
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein2.visible = false
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein3.visible = false
	elif vie == 0:
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein1.visible = false
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein2.visible = false
		$Camera2D/Control/VBoxContainer/PointDeVie/CoeurPlein3.visible = false
		$Camera2D/Control/VBoxContainer/LabelGameOver.visible = true
		$CollisionShape2D.disabled = true
		GRAVITY = 0
		estMort = true
		_animated_sprite.play("MourirArme")
		if _animated_sprite.frame == 10:
			get_tree().change_scene("res://Scene/MenuFin.tscn")
		$Timer.start()
	
	movement_loop()
	animation_loop()
	
	vel.y += GRAVITY * delta
	if estMort == false:
		vel = move_and_slide(vel, UP)

func movement_loop():
	if is_on_floor():
		jump_count = 0
	
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up")
	var shoot = Input.is_action_just_pressed("ui_accept")
	
	var dirx = int(right) - int(left)
	
	if estMort == true:
		dirx = 0
		jump = false
	
	if dirx == -1 : 
		vel.x = max(vel.x - ACCEL, -max_speed)
		$Apparence.flip_h = true
		direction = -1
		$SpawnBalle.position.x = -8
		$Camera2D/Control/VBoxContainer/FlecheGauche.modulate = "5f5f5f"
		
	elif dirx == 1 : 
		vel.x = min(vel.x + ACCEL, max_speed)
		$Apparence.flip_h = false
		direction = 1
		$SpawnBalle.position.x = 7
		$Camera2D/Control/VBoxContainer/FlecheDroite.modulate = "5f5f5f"
	else:
		vel.x = lerp(vel.x, 0, 0.15)
		vel.x = 0
		
		
	if jump == true and jump_count < 2:
		vel.y = -600
		jump_count += 1
		$Camera2D/Control/VBoxContainer/FlecheHaut.modulate = "5f5f5f"
	
	if shoot:
		$Camera2D/Control/VBoxContainer/FlecheBas.modulate = "5f5f5f"
		var b = bullet.instance()

		b.start($SpawnBalle.global_position , direction)
			
		get_parent().add_child(b)
func animation_loop():
	if vie != 0:
	
		if vel.x != 0:
			_animated_sprite.play("CourirArme")
			
		if vel.x == 0:
			_animated_sprite.play("Degainer")
			$Camera2D/Control/VBoxContainer/FlecheDroite.modulate = "ffffff"
			$Camera2D/Control/VBoxContainer/FlecheGauche.modulate = "ffffff"
			$Camera2D/Control/VBoxContainer/FlecheHaut.modulate = "ffffff"
			$Camera2D/Control/VBoxContainer/FlecheBas.modulate = "ffffff"
			
		if vel.y < 0:
			_animated_sprite.play("SauterArme")
			$Camera2D/Control/VBoxContainer/FlecheHaut.modulate = "5f5f5f"
			
		if vel.y > 0:
			_animated_sprite.play("TomberArme")
			
	
		
func animation_play(animation):
	if _animated_sprite.current_animation != animation:
		_animated_sprite.play(animation)


func _on_Timer_timeout():
	_animated_sprite.play("MourirArme")
	if _animated_sprite.frame == 10:
		get_tree().change_scene("res://Scene/MenuFin.tscn")
