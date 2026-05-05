extends Control


func _ready() -> void:
	pass 


func _on_battle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")



func _on_train_troops_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/training_panel.tscn")
