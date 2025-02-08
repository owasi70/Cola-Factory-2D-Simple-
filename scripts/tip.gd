extends Control

@onready var ok: Button = $Ok

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_ok_pressed() -> void:
	GameManager.tip_game()
