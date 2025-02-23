extends Node2D

@export var banana_scene: PackedScene
@onready var spawn_l = $SpawnL
@onready var spawn_r = $SpawnR
@onready var banana_timer = $BananaTimer
@onready var banana_holder = $BananaHolder



# Called when the node enters the scene tree for the first time.
func _ready():
	#spawn_bananas() # Replace with function body.
	pass

func spawn_bananas() -> void:
	var new_banana = banana_scene.instantiate()
	var x_pos = randf_range(spawn_l.position.x, spawn_r.position.x)
	new_banana.position = Vector2 (spawn_l.position.y, x_pos)
	banana_holder.add_child(new_banana)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_banana_timer_timeout():
	spawn_bananas()
	print("bananas")
	

