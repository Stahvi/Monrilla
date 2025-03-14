extends Node

var game_scene: PackedScene = preload("res://Scenes/Game/game.tscn")
var main_scene: PackedScene = preload("res://Scenes/Main/main.tscn")

func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)
	
func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)
	
