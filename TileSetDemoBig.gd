extends Node2D

# Map movement speed
export var speed = 75
var movement

# Map dragging flag
var drag_enabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			drag_enabled = event.pressed
			print("drag")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			drag_enabled = event.pressed
			var old_position = get_global_mouse_position()
			print("drag")
			
		if event.button_index == BUTTON_LEFT and not event.pressed:
			var new_position = get_global_mouse_position()
			movement = new_position - position;
			drag_enabled = false
			print("no drag")
			
		
	