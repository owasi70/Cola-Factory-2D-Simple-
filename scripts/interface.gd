extends Control
@onready var cash: Label = $Panel/Cash
@onready var rating: Label = $Panel2/Rating





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.On_Cash_Update.connect(on_cash_update)
	SignalManager.On_Rating_Update.connect(on_rating_update)

func on_cash_update()-> void:
	cash.text = str(ScoreManager.get_cash())

func on_rating_update()-> void:
	rating.text = str(ScoreManager.get_rating())
