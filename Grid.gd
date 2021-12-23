extends Node2D
<<<<<<< HEAD
var tile
var last_tile = null
var active = true
=======
onready var tween = $Tween

>>>>>>> parent of bf4ff87 (main game comp done)
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 4:
		spawn_tile()

func spawn_tile():
<<<<<<< HEAD
	tile = get_node("tile%d" % (randi() % 16))
	while (tile.clickable == true || tile == last_tile):
		tile = get_node("tile%d" % (randi() % 16))
	tile.generate()
=======
	var tile = get_node("tile%d" % (randi() % 24))
	print(tile)
	while (tile.pressed == false):
		tile = get_node("tile%d" % (randi() % 24))
	tile.pressed = true
	tween.interpolate_property(tile, "modulate:a", 0, 1, 0.1)
>>>>>>> parent of bf4ff87 (main game comp done)
