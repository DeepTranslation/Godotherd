extends KinematicBody2D

var speed = 50
var mouseposition
const MOTION_SPEED = 160 # Pixels/second


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _physics_process(delta):
	var motion = Vector2()

	motion = motion.normalized() * MOTION_SPEED

	move_and_collide(-motion)