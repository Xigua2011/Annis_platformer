extends Control




func _ready():
	$Your_score.text = "Your score is "+str(Globals.score) 
	$Your_time.text = "Your time is "+str(Globals.time)
	


var time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if Input.is_action_just_pressed('jump'):
		get_tree().change_scene("res://Title .tscn")
	if time > 4:
		get_tree().change_scene("res://Title .tscn")
		
		
		


func _on_button_button_down():
	print("pressed")
	get_tree().change_scene("res://Title .tscn")
	
