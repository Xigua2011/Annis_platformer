extends KinematicBody2D

var velocity = Vector2(0,0)
var jump_timer = 0

func _physics_process(delta):
	if is_on_floor():
		$alien_green.animation = 'idle_front'
		jump_timer = 0.5
		if Input.is_action_pressed('right2'):
			velocity.x += 50
			$alien_green.animation = 'walk'
		elif Input.is_action_pressed("left2"):
			velocity.x -= 50
			$alien_green.animation = 'walk'
		else:
			velocity.x = lerp(velocity.x, 0, 0.1)
	else:
		$alien_green.animation = 'jump'
		if Input.is_action_pressed('right2'):
			velocity.x += 5
		elif Input.is_action_pressed('left2'):
			velocity.x -= 5
		
	velocity.y += 20
	velocity = move_and_slide(velocity, Vector2.UP)
	if jump_timer > 0:
		jump_timer -= delta
		if Input.is_action_pressed('jump2'):
			velocity.y = -600
			if not $phaseJump1.playing: $phaseJump1.play()

	$alien_green.flip_h = velocity.x < 0
	
	velocity.x = clamp(velocity.x, -300, 300)
	
	if position.y>2000:
		kill()

	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.has_method("kill"):
			if position.y < collider.position.y - 10:
				velocity.y = -400
				collider.kill()

func kill():
	get_tree().reload_current_scene()
	
