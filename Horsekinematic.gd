extends "res://Animalkinematic.gd"

var target #food
var wolfposition
var target_path
var target_node
var my_array = load("array_2d.gd") 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target: 
		# if the horse sees the wolf it turns away from it and moves on. 
		target_path= str(get_path_to(target))
		target_node = get_node(target_path)
		wolfposition = to_local(target_node.global_position)
		rotation-= wolfposition.angle() * 0.1
		move_local_x(speed*delta)
	else:
		# if the horse doesnt see the wolf it follows the mouse
		mouseposition = get_local_mouse_position()
		rotation+= mouseposition.angle() * 0.1

		move_local_x(speed*delta)

func _physics_process(delta):
	update()
	


func _on_Visibility_body_entered(body):
	# connect this to the "body_entered" signal
	if target:
		return
	if body.name == "Wolf":
		target = body
	#print("Horse: ",body.name)
	$PlayerSprite.self_modulate.r = 1.0
	



func _on_Visibility_body_exited(body):
	# connect this to the "body_exited" signal
	if body == target:
		target = null
		$PlayerSprite.self_modulate.r = 0.2
