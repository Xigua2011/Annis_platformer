extends Node

var score = 0

var time = 0

var best_score = 0
var best_time = 9999
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("globals loading")
	var file = File.new()
	var err = file.open("user://score.dat", File.READ)
	if err == OK:
		print("file opened ok")
		score = file.get_16()
		time = file.get_16()
		print(score, time)
		file.close()
		print("file closed")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
