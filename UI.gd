extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$fade.play_backwards("screen fade")
	yield($fade, "animation_finished")

func update_score(score):
	$Score.text = str(score)

func update_time(time):
	$Time.text = str(time)


func _on_retry_pressed():
	if (get_parent().active == false):
		$fade.play("screen fade")
		yield($fade, "animation_finished")
		get_tree().change_scene("res://Title Screen.tscn")
