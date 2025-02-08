#extends Area2D
#
#@onready var player: CharacterBody2D = $"../player"
#var held_bottle = null
#@export var requested_item = ""
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#SignalManager.On_Hand_Update.connect(_on_hand_body_entered)
	#var items = ["Water" , "Juice" , "Coke"]
	#requested_item = items[randi() % items.size()]
	#print("1 : ", requested_item , " please")
	#
#
#func request_bottle(bottle : Area2D)-> void:
	#if !requested_item:
		#var requested_item = bottle
		#bottle.get_parent().remove_child(bottle)
		#add_child(bottle)
		#bottle.position = Vector2.ZERO
		#bottle.bottle_state
		#print("picked", bottle.bottle_state)
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#func _on_hand_body_entered(body: Node2D) -> void:
	#if body == player and body.held_bottle:
		#var bottle = player.held_bottle
		#if bottle.bottle_state == requested_item:
			#print("Correct item")
			##player.cash += 100
			#ScoreManager.increase_cash()
			##print(player.cash)
		#else:
			#print("Incorrect item")
			##player.rating -= 1
			##print(player.rating)
			#ScoreManager.decrease_rating()
		#player.remove_child(bottle)
		#add_child(bottle)
		#bottle.position = Vector2.ZERO
		#held_bottle = bottle
		#queue_free()
