extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Transition/AnimationPlayer").play_backwards("fade in")
	$fade.play("shrink")
	yield($fade, "animation_finished")

func update_score(score):
	$Score.text = str(score)

func update_time(time):
	$Time.text = str(time)


func _on_retry_pressed():
	if (get_parent().active == false):
		get_node("Transition/AnimationPlayer").play("fade in")
		yield(get_node("Transition/AnimationPlayer"), "animation_finished")
		get_tree().change_scene("res://Title Screen.tscn")
