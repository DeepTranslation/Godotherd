extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var grasstiles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for tiles  in range(13,18):
		globals.grasstiles += get_used_cells_by_id(tiles)

	#print(get_tileset().find_tile_by_name("Tile14"))
	#print(globals.grasstiles[2])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
