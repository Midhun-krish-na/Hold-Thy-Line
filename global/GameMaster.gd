extends Node2D

var All_units: Array = []
var selected_unit: UnitStats

var unit_scene :PackedScene

func attempt_to_spawn(pos: Vector2) -> void:
	if TrainingMaster.try_to_place_unit(selected_unit) == true:
		spawn_at(pos)
	else:
		print("No selected unit in army:")

func spawn_at(pos: Vector2):
	if selected_unit == null:
		print("No unit selected!")
		return
	
	var new_unit = unit_scene.instantiate()
	new_unit.position = pos
	get_tree().current_scene.add_child(new_unit)
	
	new_unit.initialize(selected_unit)
	All_units.append(new_unit)
