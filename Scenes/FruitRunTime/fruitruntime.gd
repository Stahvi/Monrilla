class_name FruitRunTime

extends Area2D

signal fruit_lost


@export var speed:float = 300
@export var interact: bool = false
@export var fruit_id = "banana"
@export var point: int = 1

#var fruits_data = {
	#"banana":{
		#"points":1,
		#"health_effect":"",
		#"sprite_path": "res://Assets/Images/Fruits/Single Banana.jpg",
		#"grants_powerup":"",
		#"scale": Vector2(1,1),
		#"fall_speed_multiplier":1
	#},
	#"banana_bunch": {
		#"points":4,
		#"health_effect":1,
		#"sprite_path": "res://Assets/Images/Fruits/item-banana-idle-middle-01.png",
		#"grants_powerup":"",
		#"scale": Vector2(1,1),
		#"fall_speed_multiplier":1.1
	#},
	#"berry":{
		#"points":1,
		#"health_effect":"",
		#"sprite_path": "res://Assets/Images/Fruits/acai-berry-removebg-preview.png",
		#"grants_powerup":"dash_boost",
		#"scale": Vector2(1,1),
		#"fall_speed_multiplier":1.3
	#},
	#"poisoned_banana":{
		#"points":-3,
		#"health_effect":-1,
		#"sprite_path": "res://Assets/Images/Fruits/Poison_Banana-removebg-preview.png",
		#"grants_powerup":"",
		#"scale": Vector2(1.3,1.3),
		#"fall_speed_multiplier":0.75
	#},
	#"watermelon":{
		#"points":5,
		#"health_effect":1,
		#"sprite_path": "res://Assets/Images/Fruits/vecteezy_watermelon-fruits-vector_5862483.jpg",
		#"grants_powerup":"jump_float",
		#"scale": Vector2(1,1),
		#"fall_speed_multiplier":1.5
	#},
	#"starfruit":{
		#"points":5,
		#"health_effect":1,
		#"sprite_path": "res://Assets/Images/Fruits/carambola-removebg-preview.png",
		#"grants_powerup":"jump_float",
		#"scale": Vector2(0.75,0.75),
		#"fall_speed_multiplier":1.5
	#},
#}


func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
	fruit_lost.emit()
	
