extends Node2D
var tile
var last_tile = null
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 4:
		spawn_tile()

func spawn_tile():
	tile = get_node("tile%d" % (randi() % 16))
	while (tile.clickable == true || tile == last_tile):
		tile = get_node("tile%d" % (randi() % 16))
	tile.clickable = true
	tile.generate()
