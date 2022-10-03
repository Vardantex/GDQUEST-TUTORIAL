extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseContainer")
onready var score: Label = $Death

var paused = false setget set_paused


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		self.paused = ! self.paused
		scene_tree.set_input_as_handled()

func _ready() -> void:
	PlayerData.connect("player_died", self, "_PlayerData_player_died")
	update_interface()


	
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value

func update_interface():
	score.text ="Score: %s" % PlayerData.score
