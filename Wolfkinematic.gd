extends "res://Animalkinematic.gd"

 

var horseposition
var collisions
var target #food
var target_path
var target_node
var label_text


# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 50
	label_text = self.name.lstrip("Wolf")
	$Label.text = label_text
	print(label_text)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		# if the wolf sees the horse it follows it. 
		target_path= str(get_path_to(target))
		target_node = get_node(target_path)
		horseposition = to_local(target_node.global_position)


		rotation+= horseposition.angle() * 0.1
		move_local_x(speed*delta)

	else:
		#if the wolf doesnt see the horse it follows the mouse
		mouseposition = get_local_mouse_position()
		rotation+= mouseposition.angle() * 0.1

		move_local_x(speed*delta)

func _physics_process(delta):
	update()
	var motion = Vector2()
	
	# if wolf catches horse, horse is respawned at another location, 
	# and a new round is started


	motion = motion.normalized() * MOTION_SPEED

	collisions = move_and_collide(-motion)
	if collisions:
		if "Horse" in collisions.collider.name:
			var spawntile=rand_range(0,globals.grasstiles.size())
			var x = globals.grasstiles[spawntile][0]*globals.tilesize +int(globals.tilesize/2)
			var y = globals.grasstiles[spawntile][1]*globals.tilesize +int(globals.tilesize/2)
			get_node("/root/GameSceneRoot/"+collisions.collider.name).position = Vector2(x, y)
			globals.rounds += 1
	
	if target:
        pass
		#rotation = (target.position - position).angle()
        
func _on_Visibility_body_entered(body):
	# connect this to the "body_entered" signal
	if target:
		return
	if "Horse" in body.name:
		target = body
		
	#print("Wolf: ",body.name)
		$PlayerSprite.self_modulate.r = 0.2
	
	

func _on_Visibility_body_exited(body):
	# connect this to the "body_exited" signal
	if body == target:
		target = null
		$PlayerSprite.self_modulate.r = 1.0
		