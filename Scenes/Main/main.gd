extends Node2D

@export var banana_scene: PackedScene

@onready var spawn_l = $SpawnL
@onready var spawn_r = $SpawnR
@onready var banana_timer = $BananaTimer
@onready var banana_holder = $BananaHolder

@onready var player = $Player


var score = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	player.fruit_grabbed.connect(_on_fruit_grabbed)
	
func spawn_bananas() -> void:
	var new_banana = banana_scene.instantiate()
	var x_pos = randf_range(spawn_l.position.x, spawn_r.position.x)
	new_banana.position = Vector2 (x_pos, spawn_l.position.y)
	banana_holder.add_child(new_banana)

func _on_fruit_grabbed():
	score = score + 1
	$UI/ScoreLabel.text = "Score: " + str(score)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_banana_timer_timeout():
	spawn_bananas()

	
