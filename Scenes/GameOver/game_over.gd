extends Control

@onready var timer = $Timer
@onready var go_label = $GOLabel
@onready var space_label = $SpaceLabel
@onready var sound = $Sound



# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalHub.on_player_died.connect(_on_player_died)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if space_label.visible and Input.is_action_just_pressed("grab") == true:
		GameManager.load_main_scene()
		 
func run_sequence():
	go_label.hide()
	space_label.show()

func _on_player_died():
	timer.start()
	show()
	sound.play()
	
func _on_timer_timeout():
	run_sequence()
	
	
