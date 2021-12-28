extends CanvasLayer

var sprites = [preload("res://assets/tile.png"), preload("res://assets/tile_death.png"), preload("res://assets/tile_pressed.png")]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Sprite.set_texture(sprites[randi()%3])
