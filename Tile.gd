extends Area2D
onready var sprite = $Sprite
onready var tween = $Tween
var unpressed = preload("res://assets/tile.png")
var pressed = preload("res://assets/tile_pressed.png")
export var clickable = false

func _on_Tile_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click") and clickable:
		sprite.set_texture(pressed)
		# fades the sprite out while also making it flash green
		tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(0, 1, 0, 0), 0.1)
		tween.start()
		clickable = false
		get_parent().last_tile = self
		get_parent().spawn_tile()
	elif event.is_action_pressed("click") and !clickable:
		print("game over")
		
func generate():
	sprite.set_texture(unpressed)
	tween.interpolate_property(self, "modulate", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 0.1)
	tween.start()
	print("generated")
