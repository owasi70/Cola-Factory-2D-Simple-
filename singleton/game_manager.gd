extends Node

const MAIN: PackedScene = preload("res://scenes/main.tscn")
const TIP :PackedScene = preload("res://scenes/tip.tscn")
const START_MENU = preload("res://scenes/start_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func start_game() -> void:
	print(TIP)
	get_tree().change_scene_to_packed(TIP)

func tip_game() -> void:
	print(MAIN)
	get_tree().change_scene_to_packed(MAIN)
func restart_game()-> void:
	print(START_MENU)
	get_tree().change_scene_to_packed(START_MENU)
