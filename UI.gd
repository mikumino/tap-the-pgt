extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$fade.play("shrink")
	yield($fade, "animation_finished")

func update_score(score):
	$Score.text = str(score)

func update_time(time):
	$Time.text = str(time)


func _on_retry_pressed():
	if (get_parent().active == false):
		$Transition.transition_to("res://Title Screen.tscn")
