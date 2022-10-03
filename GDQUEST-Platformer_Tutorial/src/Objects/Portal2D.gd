extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready() -> void:
	pass

func _on_Portal2D_body_entered(body: Node) -> void:
	teleport()


#Export a var that stores any scene for portal
export var next_scene: PackedScene

#Create a warning to require a scene for the expored var 
func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""

func teleport():
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
