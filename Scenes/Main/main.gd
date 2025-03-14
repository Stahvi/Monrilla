extends Control



func _process(delta):
	if Input.is_action_just_pressed("grab") == true:
		GameManager.load_game_scene()
					


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
