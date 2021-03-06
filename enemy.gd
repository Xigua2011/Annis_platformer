extends KinematicBody2D

var direction = Vector2.LEFT
var velocity = Vector2(-50, 0)

export var JUMP=200

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += 20
	velocity.x = direction.x * 50
	velocity = move_and_slide(velocity, Vector2.UP)
	$ghost.flip_h = velocity.x > 0
	
	if is_on_wall():
		direction = -direction
		
	if is_on_floor():
		velocity.y = -JUMP
		
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.has_method("kill"):
			collider.kill()

func kill():
	$pepSound3.play()
	direction = Vector2.ZERO
	$ghost.animation = 'dead'
	$collision_shape_2d.disabled = true
	get_node("/root/main/HUD").inc_score()
