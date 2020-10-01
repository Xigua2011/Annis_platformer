extends Node2D


# Declare member variables here. Examples:
# var a = 2
 # var b       = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Title screen loading")
	$score.text = str(Globals.score)
	$time.text = str(Globals.time)
	print("Title screen ready")
	#var file = File.new()
	#file.open("C:/Users/chenf/Documents/Anni/test.txt", File.WRITE)
	#file.store_string("hello")
	#file.close()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Level_1_pressed():
	get_tree().change_scene("res://level1.tscn")


func _on_Level_2_pressed():
	get_tree().change_scene("res://level2.tscn")
	
func _on_Quit_pressed():
	get_tree().quit() 
	

