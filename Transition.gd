extends CanvasLayer

export(String, FILE, "*.tscn") var next_scene_path
var sprites = [preload("res://assets/tile.png"), preload("res://assets/tile_death.png"), preload("res://assets/tile_pressed.png"), preload("res://assets/tile_rare.png")]
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Sprite.set_texture(sprites[randi()%3])
	if (randi()%100 == 99):
		$Sprite.set_texture(sprites[3])
	anim_player.play("fade")
	
func transition_to(next_scene := next_scene_path):
	anim_player.play_backwards("fade")
	yield(anim_player, "animation_finished")
	get_tree().change_scene(next_scene)
