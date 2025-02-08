extends Node

var _cash: int 
var _rating := 3
const LVLCOMPLETE = preload("res://scenes/lvlcomplete.tscn")
const GAMEOVER = preload("res://scenes/gameover.tscn")
#const MAIN: PackedScene = preload("res://scenes/main.tscn")




func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

#func start_game()-> void:
	##get_tree().change_scene_to_packed(MAIN)
	
func get_cash():
	return _cash

func set_cash(Value: int)-> void:
	_cash = Value
	SignalManager.On_Cash_Update.emit()
	if _cash >= 500:
		get_tree().change_scene_to_packed(LVLCOMPLETE)


func get_rating():
	return _rating

func set_rating(Value: int)-> void:
	_rating = Value
	SignalManager.On_Rating_Update.emit()
	if _rating <= 0:
		get_tree().change_scene_to_packed(GAMEOVER)


func increase_cash(item : String)-> void:
	var reward = 0
	match item:
		"Water":
			reward = 20
		"Coke":
			reward = 40
		"Juice":
			reward = 80
	set_cash(_cash + reward)

func decrease_rating()-> void:
	set_rating(_rating-1)
