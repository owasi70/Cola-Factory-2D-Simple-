extends Area2D


@onready var juicesound: AudioStreamPlayer2D = $juicesound
@onready var fill_bar: ProgressBar = $fill_bar
@onready var level_label: Label = $levelLabel
@onready var update_area: Area2D = $update_area
@onready var animatesprite_2d: AnimatedSprite2D = $animatesprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


var fill_progress : float = 0.0
var machine_lvl: int = 1
var fill_speed : float = 5
var fill_speed_multiplier : float = 1.0
var is_filling: bool = false
var bottle : Node = null
var upgrade_costs : int = 30
var max_level = 4



func _ready()-> void:
	fill_progress = 0
	fill_bar.value = fill_progress
	update_ui()

func _process(delta: float) -> void:
	check_sprite_visibility()


func check_sprite_visibility() -> void:
	if ScoreManager.get_cash() >= upgrade_costs and machine_lvl < max_level:
		animatesprite_2d.visible = true
		animatesprite_2d.play("play")  
	else:
		animatesprite_2d.visible = false

func update_fill_speed()-> void:
	fill_speed_multiplier = 1 + (machine_lvl - 1) * 0.5

func update_ui() -> void:
	level_label.text = "Lvl " + str(machine_lvl)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and !body.held_bottle:
		return 
		print("GG")
	if body.is_in_group("player") and body.held_bottle:
		bottle = body.held_bottle
		print("Player has a ",bottle.name , "bottle is " , bottle.bottle_state)
		if bottle.bottle_state == "Water":
			fill_progress = 0
			fill_bar.value = fill_progress
			update_fill_speed()  
			is_filling = true
			filling_process()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") and body.held_bottle:
		if is_filling and fill_progress < 100:
			print("Player left")
			is_filling = false
			fill_progress = 0
			fill_bar.value = fill_progress



func filling_process()-> void:
	juicesound.play()
	while is_filling and fill_progress < 100:
		await get_tree().create_timer(0.1).timeout
		fill_progress += fill_speed * fill_speed_multiplier * 0.1
		fill_bar.value = fill_progress
	juicesound.stop()
	if fill_progress >= 100:
		bottle.bottle_state = "Juice"
		print("Bottle is filled with Juice")
		await get_tree().create_timer(2.0).timeout
		fill_progress = 0
		fill_bar.value = fill_progress
		is_filling = false

func _on_update_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		upgrade_machine()


func upgrade_machine() -> void:
	if ScoreManager.get_cash() >= upgrade_costs and machine_lvl < max_level:
		ScoreManager.set_cash(ScoreManager.get_cash() - upgrade_costs)
		machine_lvl += 1
		update_fill_speed()  
		update_ui()  
		print("Machine upgraded to level", machine_lvl)
		audio_stream_player.play()
	else:
		print("Not enough cash or max level reached!")
