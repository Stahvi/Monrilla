extends CharacterBody2D

var run_speed = 400
var jump_speed = -1000
var gravity = 2500
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
func get_input():
	velocity.x = 0
	var left = Input.is_action_pressed("move_left")
	var right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_pressed("jump")
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed("move_left"):
	#	velocity.x -= 1
	#if Input.is_action_pressed("move_right"):
	#	velocity.x += 1
	#if Input.is_action_pressed("jump")
	
	if is_on_floor() and jump:
			velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
		
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()
