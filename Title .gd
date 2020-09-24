extends Node2D


# Declare member variables here. Examples:
# var a = 2
 # var b       = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var file = File.new()
	#file.open("C:/Users/chenf/Documents/Anni/test.txt", File.WRITE)
	#file.store_string("hello")
	#file.close()
	var file = File.new()
	file.open("user://score.dat", File.READ)
	var score = file.get_16()
	var time = file.get_16()
	$score.text = str(score)
	$time.text = str(time)
	print(score, time)
	file.close()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Level_1_pressed():
	get_tree().change_scene("res://level1.tscn")


func _on_Level_2_pressed():
	get_tree().change_scene("res://level2.tscn")
	
func _on_Quit_pressed():
	get_tree().quit() 
	

