extends CharacterBody2D



@export var requested_item = ""
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cashsound: AudioStreamPlayer2D = $cashsound
@onready var boosound: AudioStreamPlayer2D = $boosound
#@onready var orderlabel: Label = $orderlabel
#@onready var water: Sprite2D = $order_panel/water
@onready var water: Sprite2D = $order_panel/water
@onready var juice: Sprite2D = $order_panel/juice
@onready var coke: Sprite2D = $order_panel/coke
@onready var ray_cast_2d: RayCast2D = $RayCast2D


@onready var player: CharacterBody2D = get_parent().get_node("player")

var held_bottle = null

var target_position: Vector2

var speed: float = 10.0

func set_waiting_position(position: Vector2) -> void:
	target_position = position

func _physics_process(delta: float) -> void:
	if ray_cast_2d.is_colliding():
		var collider = ray_cast_2d.get_collider()
		if collider:  
			velocity = Vector2.ZERO
			animated_sprite_2d.play("wait")
			return

	# Move towards the target position if not colliding
	if position.distance_to(target_position) > 1:
		velocity = (target_position - position).normalized() * speed
		animated_sprite_2d.play("walk")
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("wait")
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var items = ["Water" , "Juice" , "Coke"]
	requested_item = items[randi() % items.size()]
	print("1 : ", requested_item , " please")
	update_order_display()

func update_order_display() -> void:
	water.visible = requested_item == "Water"
	juice.visible = requested_item == "Juice"
	coke.visible = requested_item == "Coke"



func request_bottle(bottle : Area2D)-> void:
	if !requested_item:
		requested_item = bottle.bottle_state
		bottle.get_parent().remove_child(bottle)
		add_child(bottle)
		bottle.position = Vector2.ZERO
		bottle.bottle_state
		print("picked", bottle.bottle_state)




func _on_hand_body_entered(body: Node2D) -> void:
	
	print("Hand detected:", body.name)
	if body.name:
		animated_sprite_2d.play("wait")
	if body.is_in_group("player") and !body.held_bottle:
		return 
		print("GG")
	if body.is_in_group("player") and body.held_bottle:
		var bottle = body.held_bottle
		print("Bottle Detected: ", bottle.bottle_state)
		if bottle.bottle_state == requested_item:
			print("Correct item")
			#player.cash += 100
			ScoreManager.increase_cash(requested_item)
			cashsound.play()
			#print(player.cash)
		else:
			print("Incorrect item")
			#player.rating -= 1
			#print(player.rating)
			ScoreManager.decrease_rating()
			boosound.play()
		body.remove_child(bottle)
		add_child(bottle)
		bottle.position = Vector2.ZERO
		held_bottle = bottle
		if get_tree():
			await get_tree().create_timer(2.0).timeout
			call_deferred("queue_free")
