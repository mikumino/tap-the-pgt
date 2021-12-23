extends Area2D
onready var sprite = $Sprite
onready var tween = $Tween
var unpressed = preload("res://assets/tile.png")
var pressed = preload("res://assets/tile_pressed.png")
var death = preload("res://assets/tile_death.png")
var clickable = false

func _on_Tile_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		print("clicky")
	if event.is_action_pressed("click") and clickable and get_parent().active:
		sprite.set_texture(pressed)
		# fades the sprite out while also making it flash green
		$Green.visible = true
		tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.1)
		tween.start()
		clickable = false
		get_parent().last_tile = self
		get_parent().increase_score()
		get_parent().spawn_tile()
	elif event.is_action_pressed("click") and !clickable and get_parent().active:
		print("game over")
		get_parent().game_over()
		sprite.set_texture(death)
		tween.interpolate_property(self, "modulate", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 0.1)
		tween.start()
		$Red.visible = true
		$Flash.play("Death")
		
func generate():
	clickable = true
	$Green.visible = false
	sprite.set_texture(unpressed)
	tween.interpolate_property(self, "modulate", Color(0, 0, 0, 0), Color(1, 1, 1, 1), 0.1)
	tween.start()
	print("generated")
