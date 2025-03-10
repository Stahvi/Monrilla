extends CharacterBody2D

signal fruit_grabbed

@export var move_force:float = 500.0
@export var move_accel:float = 0.45
@export var move_damp:float = 0.4
var gravity = 2500
var screen_size

@export var jump_force:float = -1000.00
@export var jump_damp:float = 0.06

var interact: bool = false
var was_in_air: bool = false
var current_grababble = null


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass
	#get_input()

func my_get_gravity() -> float:
	return gravity

#func get_input():
	#velocity.x = 0
	#var left = Input.is_action_pressed("move_left")
	#var right = Input.is_action_pressed("move_right")
	#var jump = Input.is_action_pressed("jump")
	##var velocity = Vector2.ZERO
	##if Input.is_action_pressed("move_left"):
	##	velocity.x -= 1
	##if Input.is_action_pressed("move_right"):
	##	velocity.x += 1
	##if Input.is_action_pressed("jump")
	#
	#if is_on_floor() and jump:
			#velocity.y = jump_speed
	#if right:
		#velocity.x += run_speed
	#if left:
		#velocity.x -= run_speed
		
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += my_get_gravity() * delta
		was_in_air = true
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		$JumpSound.play()
		was_in_air = true
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = velocity.y * jump_damp
		
	if is_on_floor() and was_in_air == true:
		was_in_air = false
		$FallSound.play()
				
				
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * move_force, move_force * move_accel)
	else:
		velocity.x = move_toward(velocity.x, 0, move_force * move_damp)
		
	#velocity.y += gravity * delta
	move_and_slide()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#fruit grabbing
	if interact == true and Input.is_action_just_pressed("grab"):
		current_grababble.queue_free()
		current_grababble = null
		interact = false
		#print("banana grabbed")
		fruit_grabbed.emit()
		

#Deteccao pra Grab de frutas
#func _on_body_entered(body: Area2D) -> void:
	#if body.is_in_group("grabbable"):
		#interact = true
		#current_grababble = body
		#print("body entered true")

#func _on_body_exited(body: Area2D) -> void:
	#if body.is_in_group("grabbable"):
		#interact = false # Replace with function body.
		#current_grababble = null
		#print("body entered false")


#detection for grabbable item in
func _on_pickup_zone_area_shape_entered(area_rid, area, area_shape_index, local_shape_index) -> void:
	#print("Something entered: ", area.name)
	if area.is_in_group("grabbable"):
		interact = true
		current_grababble = area
		#print("body entered true")
	 # Replace with function body.

#detection for grabbable item out
func _on_pickup_zone_area_shape_exited(area_rid, area, area_shape_index, local_shape_index) -> void:
	if area != null and area.is_in_group("grabbable"):
		interact = false # Replace with function body.
		current_grababble = null
		#print("body entered false")
