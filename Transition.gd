extends CanvasLayer

export(String, FILE, "*.tscn") var next_scene_path
var sprites = [preload("res://assets/tile.png"), preload("res://assets/tile_death.png"), preload("res://assets/tile_pressed.png")]
onready var anim_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	anim_player.play_backwards("fade in")
	
func transition_to(next_scene := next_scene_path):
	$Sprite.set_texture(sprites[randi()%3])
	anim_player.play("fade in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene(next_scene)
