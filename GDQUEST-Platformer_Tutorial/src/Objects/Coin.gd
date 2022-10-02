extends Area2D

#TODO: COIN IS BORKEN, USE OLD METHOD TO FIX

#Prepare the animation to be called
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")



#################

func _ready() -> void:
	pass

#Call the prepared animation that has the fade out animation
func _on_body_entered(body: Node) -> void:
	anim_player.play("fade_out")
