extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity = Vector2(100,0)
export var period = 5
var time = 0
export var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate():
	started = true
	#print("platform activate")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if started:
		position += velocity * delta
		time += delta
		if time > period:
			time=0
			velocity = -velocity
#	passpo
