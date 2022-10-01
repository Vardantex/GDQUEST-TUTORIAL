extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2.UP

var _velocity: = Vector2.ZERO

#Speed variable used to limit _velocity value
export var speed = Vector2(300.0, 800.0)
export var gravity: = 3000.0

func _ready():
	pass

#Calls every frame of the game
#func _physics_process(delta: float) -> void:
	

	
	#If falling, limit the increased speed of fall
#	if _velocity.y > speed.y:
#		_velocity.y = max(_velocity.y, speed.y)
	#Character moves at 300 pixels a second 


