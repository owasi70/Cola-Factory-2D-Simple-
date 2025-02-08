extends CharacterBody2D

class_name PLAYER
@export var speed :float= 100

@export var rating := 3
var held_bottle = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("A","D","W","S")
	velocity = input_direction * speed 
	movement()
	move_and_slide()


func movement() -> void:
	if Input.is_action_pressed("W"):
		$AnimatedSprite2D.play("walk_top")
	elif Input.is_action_pressed("A"):
		$AnimatedSprite2D.play("walk_left")
	elif Input.is_action_pressed("D"):
		$AnimatedSprite2D.play("walk_right")
	#elif Input.is_action_just_pressed("W" + "D"):
		#$AnimatedSprite2D.play("walk_NE")
	elif Input.is_action_pressed("S"):
		$AnimatedSprite2D.play("walk_bottom")
	else:
		$AnimatedSprite2D.play("idle")

func pick_up_bottle(bottle:Area2D) -> void:
	if !held_bottle:
		held_bottle = bottle
		bottle.get_parent().remove_child(bottle)
		add_child(bottle)
		bottle.position = Vector2.ZERO
		bottle.bottle_state
		print("picked", bottle.bottle_state)
