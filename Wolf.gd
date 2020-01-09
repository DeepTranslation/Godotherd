extends Node2D

var speed = 50
var horseposition
const MOTION_SPEED = 160 # Pixels/second

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  horseposition = to_local(get_node("/root/GameSceneRoot/Horse").global_position)
  #horseposition = to_local(get_parent().get_node("Horse").global_position)
  #horseposition = GameSceneRoot.Horse.position
  #look_at(mouseposition)
  rotation+= horseposition.angle() * 0.1
  
  move_local_x(speed*delta)
  #move_local_x(-speed*delta)

