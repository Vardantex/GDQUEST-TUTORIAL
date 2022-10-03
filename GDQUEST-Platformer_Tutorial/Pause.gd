extends Control


func _ready() -> void:
	pass




func _on_PauseButton_button_up() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


