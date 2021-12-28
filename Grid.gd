extends Node2D
var tile
var last_tile = null
var active = true
var score = 0
var time = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 4:
		spawn_tile()

func spawn_tile():
	tile = get_node("tile%d" % (randi() % 16))
	while (tile.clickable == true || tile == last_tile):
		tile = get_node("tile%d" % (randi() % 16))
	tile.generate()
	
func increase_score():
	score += 1
	$UI.update_score(score)

func game_over():
	$Timer.stop()
	active = false
	get_node("UI/fade").play("fade")


func _on_Timer_timeout():
	time -= 1
	if time == 0:
		get_node("UI/timeup").play("timeup")
		game_over()
	$UI.update_time(time)
