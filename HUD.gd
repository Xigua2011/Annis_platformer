extends CanvasLayer



func inc_score():
	set_score(Globals.score + 1)
	
func set_score(s):
	Globals.score = s
	$score.set_text(str(Globals.score))

func _on_left_button_pressed():
	Input.action_press("left")

func _on_left_button_released():
	Input.action_release("left")

func _on_right_button_pressed():
	Input.action_press("right")

func _on_right_button_released():
	Input.action_release("right")

func _on_jump_button_pressed():
	Input.action_press("jump")

func _on_jump_button_released():
	Input.action_release("jump")





func _on_timer2_timeout():
	Globals.time += 1
	$time.set_text(str(Globals.time))
