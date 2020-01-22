extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var HorseKinematic

func spawning_horses(number):
	for horse_number in range(number):
		var spawntile=rand_range(0,globals.grasstiles.size())
		var x = globals.grasstiles[spawntile][0]*globals.tilesize +int(globals.tilesize/2)
		var y = globals.grasstiles[spawntile][1]*globals.tilesize +int(globals.tilesize/2)
		#get_node("/root/GameSceneRoot/"+collisions.collider.name).position = Vector2(x, y)
		
		# Create a Horse instance and add it to the scene.
		var horsekinematic = preload("res://HorseKinematic.tscn")
		var horse = horsekinematic.instance()
		add_child(horse)
		# Set the horses position to a random grass tile.
		horse.position = Vector2(x, y)
		# Set the horses direction randomly
		
		var direction = rand_range(-2* PI , 2 * PI )
		horse.rotation = direction
		# Choose the velocity.
		#horse.set_linear_velocity(Vector2(rand_range(0, horse.speed), 0).rotated(direction))
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
