extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Zoom Camera
func _zoom_camera(dir):
	zoom += Vector2(0.1, 0.1) * dir

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		get_tree().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_tree().set_input_as_handled();
		position += (_previousPosition - event.position);
		_previousPosition = event.position;
	
	
	# TODO: zooming in and out
	# Wheel Up Event
	if event.is_action_pressed("zoom_in"):
		print("zoom in")
		_zoom_camera(-1)
    # Wheel Down Event
	elif event.is_action_pressed("zoom_out"):
		print("zoom out")
		_zoom_camera(1)