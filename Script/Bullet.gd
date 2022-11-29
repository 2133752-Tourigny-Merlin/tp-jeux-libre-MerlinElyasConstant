extends KinematicBody2D

export var speed = 500
var velocity = Vector2(10,0)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	translate(velocity)
