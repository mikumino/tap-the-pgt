extends Node2D
onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 4:
		spawn_tile()

func spawn_tile():
	var tile = get_node("tile%d" % (randi() % 24))
	print(tile)
	while (tile.pressed == false):
		tile = get_node("tile%d" % (randi() % 24))
	tile.pressed = true
	tween.interpolate_property(tile, "modulate:a", 0, 1, 0.1)
