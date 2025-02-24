extends CharacterBody2D

@export var move_force:float = 500.0
@export var move_accel:float = 0.06
@export var move_damp:float = 0.05
var gravity = 2500
var screen_size

@export var jump_force:float = -1000.00
@export var jump_damp:float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	#get_input()


func get_gravity() -> float:
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
		velocity.y += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = velocity.y * jump_damp
		
				
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * move_force, move_force * move_accel)
	else:
		velocity.x = move_toward(velocity.x, 0, move_force * move_damp)
		
	#velocity.y += gravity * delta
	move_and_slide()
