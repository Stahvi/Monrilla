extends Area2D

@export var speed:float = 300
# Called when the node enters the scene tree for the first time.
var interact: bool = false

func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free() # Replace with function body.

#Deteccao pra Grab de frutas
func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		interact = true
			

func _on_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		interact = false # Replace with function body.

func _input(event):
