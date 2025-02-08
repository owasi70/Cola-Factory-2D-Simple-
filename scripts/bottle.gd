extends Area2D

class_name  BOTTLE


@export var bottle_state ="Empty"
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bottle_state =="Empty":
		pass
	elif bottle_state =="Water":
		sprite_2d.modulate = Color.DARK_BLUE
	elif  bottle_state =="Coke":
		sprite_2d.modulate = Color.BROWN
	elif bottle_state == "Juice":
		sprite_2d.modulate = Color.YELLOW





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") :
		body.pick_up_bottle(self)
