extends Node2D

var speed = 55
var mouseposition
#var rotation_dir = 0
#var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#move_local_x(speed*delta)
	mouseposition = get_local_mouse_position()
	#look_at(mouseposition)
	rotation+= mouseposition.angle() * 0.1
  
	move_local_x(speed*delta)
	#move_local_y(speed*delta)
	#if is_colliding:
	#	print("Collission")
		
#func _physics_process(delta):
	#var collision = move_and_collide(velocity * delta)
	#if collision:
   # 	velocity = velocity.slide(collision.normal)
		
	
	
