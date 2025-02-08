#extends Node2D
#
#const customer_scene = preload("res://scenes/customer.tscn") 
##@export var customer_scene: CUSTOMER
#
#@onready var destination_markers = [$DestinationMarker1, $DestinationMarker2, $DestinationMarker3]  # Your destination markers
#@onready var spawn_marker = $SpawnMarker  # The marker where customers will spawn
#@onready var customer_container = $CustomerContainer
#
#var requested_items = ["Water", "Juice", "Coke"]
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass
#
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#func _on_timer_timeout() -> void:
	#var new_cus:CUSTOMER = customer_scene.instantiate()
	#new_cus.global_position = spawn_marker.global_position
	#add_child(new_cus)
	#var new_hand: Area2D = new_cus.get_node("hand")
	#if new_hand:
		#new_hand.body_entered.connect(new_cus._on_hand_body_entered)
	#if new_cus:
		#var random_marker = destination_markers[floor(randf()*destination_markers.size())].global_position
		#print(random_marker)
		#var tween = create_tween()
		#tween.TRANS_SINE
		#tween.tween_property(new_cus, "global_position", random_marker, 10.0)
		#
