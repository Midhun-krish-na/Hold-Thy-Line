extends Control

@export_file("*.tscn") var previous_scene_path: String = "res://scene/home_ui.tscn"


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file(previous_scene_path)
