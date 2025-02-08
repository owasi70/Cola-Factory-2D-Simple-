extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var startingmusic: AudioStreamPlayer2D = $startingmusic
#var MAIN: PackedScene = load("res://scenes/main.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingmusic.play()
	
	#start_button.pressed.connect(_on_start_button_pressed)



func _on_start_button_pressed() -> void:
	#ScoreManager.start_game()
	#get_tree().change_scene_to_packed(MAIN)
	GameManager.start_game()
