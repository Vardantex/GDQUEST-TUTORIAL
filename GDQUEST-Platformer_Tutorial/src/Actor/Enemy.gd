extends "res://src/Actor/Actor.gd"


func _ready() -> void:
	_velocity.x = -speed.x
	#Process is paused until its in camera view
	set_physics_process(false)


func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()

func _physics_process(delta: float) -> void:
	
	#Apply gravity to the enemy 
	_velocity.y += gravity * delta
	
	#ALter movement if connected with a wall
	if is_on_wall():
		_velocity.x *= -1.0
	
	#MOVE
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
