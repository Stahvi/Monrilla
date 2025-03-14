extends Node2D

@export var fruitruntime_scene: PackedScene

@onready var spawn_l = $SpawnL
@onready var spawn_r = $SpawnR
@onready var fruit_timer = $FruitTimer
@onready var fruit_holder = $FruitHolder
@onready var player = $Player
@export var score = 0 
@export var health_points = 5

var banana_data = preload("res://Database/Fruit/banana.tres")
var banana_bunch_data = preload("res://Database/Fruit/banana_bunch.tres")
var poisoned_banana_data = preload("res://Database/Fruit/poisoned_banana.tres")
var watermelon_data = preload("res://Database/Fruit/watermelon.tres")

var fruit_box = [banana_data,banana_bunch_data,poisoned_banana_data,watermelon_data]


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalHub.on_player_died.connect(_on_player_died)
	SignalHub.fruit_grabbed.connect(_on_fruit_grabbed)
	SignalHub.fruit_lost.connect(_on_fruit_lost)
	$UI/HealthLabel.text =  "HP: " + str(health_points)
	$UI/ScoreLabel.text = "Score: " + str(score)
	$Music.play()
	
	
	#SPAWN FRUIT VERSION 1
#func spawn_fruit() -> void:
	#var new_fruit = fruitruntime_scene.instantiate()
	#print("Banana Instantiated")
	#var x_pos = randf_range(spawn_l.position.x, spawn_r.position.x)
	#new_fruit.position = Vector2 (x_pos, spawn_l.position.y)
	#fruit_holder.add_child(new_fruit)
	
func spawn_fruit() -> void:
	var fruit_index = randi() % fruit_box.size()
	var fruit_selected = fruit_box[fruit_index]
	var new_fruit = fruitruntime_scene.instantiate()
	new_fruit._setup(fruit_selected)	
	var x_pos = randf_range(spawn_l.position.x, spawn_r.position.x)
	new_fruit.position = Vector2 (x_pos, spawn_l.position.y)
	fruit_holder.add_child(new_fruit)
	
	
func stop_fruit():
	fruit_timer.stop()
	for fruitruntime in fruit_holder.get_children():
		fruitruntime.set_process(false)
		
	
func _on_fruit_grabbed():
	score = score + 1
	$UI/ScoreLabel.text = "Score: " + str(score)
	$BananaGrabbedSound.play()
	
func _on_fruit_lost():
	health_points = health_points - 1
	$UI/HealthLabel.text = "HP: " + str(health_points)
	$BananaLostSound.play()
	if health_points == 0:
		player.die()
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fruit_timer_timeout():
	spawn_fruit()

func _on_player_died():
	stop_fruit()
	
	
