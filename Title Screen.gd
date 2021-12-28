extends Control

var sprites = [preload("res://assets/tile.png"), preload("res://assets/tile_death.png"), preload("res://assets/tile_pressed.png")]
var index = 0

func _ready():
	pass

func _on_play_pressed():
	$Transition.transition_to("res://Grid.tscn")

func _on_ptg_pressed():
	$ptg.texture_normal = sprites[index]
	index += 1
	if index == 3:	index = 0
