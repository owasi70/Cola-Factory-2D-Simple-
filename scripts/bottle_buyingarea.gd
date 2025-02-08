extends Area2D

@onready var markers = [$Marker2D, $Marker2D2, $Marker2D3, $Marker2D4, $Marker2D5]
var bottle_scene = load("res://scenes/bottle.tscn")
var placed_bottles = []  
var delivery_in_progress = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var call: AudioStreamPlayer = $call

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and !delivery_in_progress :
		placed_bottles = placed_bottles.filter(is_instance_valid)
	if placed_bottles.size() > 0:
		return  
	if body.is_in_group("player") and !delivery_in_progress :
		if ScoreManager.get_cash() >= 30:
			ScoreManager.set_cash(ScoreManager.get_cash() - 30)
			call.play()
			start_delivery()
			delivery_in_progress = false 
		else:
			print("Not enough cash to order bottles!")

func start_delivery() -> void:
	delivery_in_progress = true  
	print("Delivery van is arriving...")
	animation_player.play("arrival") 
#$DeliveryVanAnimationPlayer.play("arrive")
	await get_tree().create_timer(5.0).timeout  
	print("Bottles are being delivered...")

	for marker in markers:
		var bottle = bottle_scene.instantiate()
		bottle.position = marker.global_position
		get_parent().add_child(bottle)
		placed_bottles.append(bottle)
		print("Bottles are placed")
