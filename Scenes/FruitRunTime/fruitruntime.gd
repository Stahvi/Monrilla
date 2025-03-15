class_name FruitRunTime

extends Area2D



@export var speed:float = 300
@export var interact: bool = false
@export var fruit_id = ""
@export var point: int = 1
@export var health_effect: int = 0



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

func _setup(fruit_data: FruitData):
	speed = fruit_data.fall_speed_multiplier*300
	point = fruit_data.points
	health_effect = fruit_data.health_effect
	$Sprite2D.texture = fruit_data.sprite2d
	var texture_size = $Sprite2D.texture.get_size()
	var target_size = Vector2(200,200)
	
# Debug output
	print("Fruit: ", fruit_data.name)
	print("Texture size: ", texture_size)
	
	# Calculate scale using width as reference for consistent width
	var scale_x = target_size.x / texture_size.x
	var scale_y = target_size.y / texture_size.y
	var scale_factor = min(scale_x, scale_y)
	# Limit maximum scale to prevent small textures from becoming too large
	if scale_factor > 1.0:
		scale_factor = 1.0
	# Apply the custom scale from FruitData
	scale_factor *= fruit_data.custom_scale.x  # Assuming you want the same scaling for both axes
	print("Scale factor: ", scale_factor)
	# Apply the scale to the sprite
	$Sprite2D.scale = Vector2(scale_factor, scale_factor)
	# Confirm final scale
	print("Final sprite scale: ", $Sprite2D.scale)
	
	
	fruit_id = fruit_data.name
	health_effect = fruit_data.health_effect
	
	
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
	SignalHub.fruit_lost.emit()
	
