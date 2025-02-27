extends Area2D

signal fruit_lost

@export var speed:float = 300
# Called when the node enters the scene tree for the first time.
var interact: bool = false
var fruit_type = "banana"
var point: int = 1

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # Replace with function body.
	fruit_lost.emit()
	
