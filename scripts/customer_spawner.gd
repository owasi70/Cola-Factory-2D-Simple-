extends Node2D

@export var customer_scenes: Array[PackedScene] = []
@onready var spawn_point: Marker2D = $SpawnPoint
@onready var waiting_position: Node2D = $"../WaitingPosition"
@onready var spawn_area: Area2D = $spawn_area


var spawn_delay: float = 10.0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_customer_timer(spawn_delay)


func spawn_customer_timer(interval: float) -> void:
	var timer = Timer.new()
	timer.wait_time = interval
	timer.autostart = true
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_spawn_customer_timer_timeout"))
	add_child(timer)

func _on_spawn_customer_timer_timeout() -> void:
	spawn_customer()


func spawn_customer() -> void:
	if customer_scenes.size() == 0:
		return
	if is_spawn_area_clear():
		var random_scene = customer_scenes[randi() % customer_scenes.size()]
		var customer = random_scene.instantiate()
		customer.position = spawn_point.global_position  
		if customer.has_method("set_waiting_position"):
			customer.set_waiting_position(waiting_position.global_position)
		print("Spawning Customer:", customer)
		add_child(customer)
	else:
		print("Spawn area is blocked. Waiting to spawn.")

func is_spawn_area_clear() -> bool:
	return spawn_area.get_overlapping_bodies().size() == 0
