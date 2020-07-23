extends KinematicBody2D

var velocity = Vector2(0,0)
var jump_timer = 0

export var JUMP_POWER = 600

func _physics_process(delta):
	if is_on_floor():
		$alien_pink.animation = 'idle_front'
		jump_timer = 0.5
		if Input.is_action_pressed('right'):
			velocity.x += 50
			$alien_pink.animation = 'walk'
		elif Input.is_action_pressed("left"):
			velocity.x -= 50
			$alien_pink.animation = 'walk'
		else:
			velocity.x = lerp(velocity.x, 0, 0.1)
	else:
		$alien_pink.animation = 'jump'
		if Input.is_action_pressed('right'):
			velocity.x += 5
		elif Input.is_action_pressed('left'):
			velocity.x -= 5
		
	velocity.y += 20
	velocity = move_and_slide(velocity, Vector2.UP)
	if jump_timer > 0:
		jump_timer -= delta
		if Input.is_action_pressed('jump'):
			velocity.y = -JUMP_POWER
			if not $phaseJump1.playing: $phaseJump1.play()

	$alien_pink.flip_h = velocity.x < 0
	
	velocity.x = clamp(velocity.x, -300, 300)
	
	if position.y>2000:
		kill()

	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.has_method("activate"):
			collider.activate()
		if collider.has_method("kill"):
			if position.y < collider.position.y - 10:
				velocity.y = -JUMP_POWER/2
				collider.kill()
				
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func kill():
	get_tree().reload_current_scene()
	


func _on_Goal_body_entered(body):
	print("hello")
	get_tree().change_scene("res://you_won.tscn")
