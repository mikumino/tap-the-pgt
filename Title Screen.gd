extends Control



func _on_play_pressed():
	$AnimationPlayer.play("fade")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Grid.tscn")
