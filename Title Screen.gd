extends Control

var sprites = [preload("res://assets/tile.png"), preload("res://assets/tile_death.png"), preload("res://assets/tile_pressed.png")]
var index = 0

func _ready():
	get_node("Transition/AnimationPlayer").play_backwards("fade in")

func _on_play_pressed():
	get_node("Transition/AnimationPlayer").play("fade in")
	yield(get_node("Transition/AnimationPlayer"), "animation_finished")
	get_tree().change_scene("res://Grid.tscn")

func _on_ptg_pressed():
	$ptg.texture_normal = sprites[index]
	index += 1
	if index == 3:	index = 0
	
func play_fade():
	get_node("Transition/AnimationPlayer").play_backwards("fade in")
