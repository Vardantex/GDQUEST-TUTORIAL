extends Actor



func _ready():
	pass

func _physics_process(delta: float) -> void:
	var is_jump_interupt = Input.is_action_just_released("move_up") and _velocity.y < 0.0
	
	var direction = get_direction()
	

	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interupt)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_direction() -> Vector2:
	return Vector2(
	#Track player's input (Left, Right, Gravity)
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	 -1.0 if Input.is_action_just_pressed("move_up") and 
	is_on_floor() else 1.0
		
	)

#Calculate a new _velocity for jumping (_velocity, direction, speed)
func calculate_move_velocity(linear_velocity: Vector2,
direction: Vector2,
speed,
is_jump_interupt: bool) -> Vector2:
	var out = linear_velocity
	out.x = speed.x * direction.x
	
	#Apply gravity to the movement: get delta raw without having to add a new parameter
	out.y += gravity * get_physics_process_delta_time()

	#Check if the character jumped
	if direction.y == -1.0:
		print("Attempting to jump")
		out.y = speed.y * direction.y
	if is_jump_interupt:
		out.y = 0.0
		
	if Input.is_action_just_pressed("move_left"):
		print("Moving left")
	elif Input.is_action_just_pressed("move_right"):
		print("Moving Right")
	return out
