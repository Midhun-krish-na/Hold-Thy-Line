extends Control

@export var Infantry: UnitStats
@export var Archer: UnitStats
@export var Cavalry: UnitStats


func _on_infantry_pressed() -> void:
	GameMaster.selected_unit = Infantry
	print("selected unit:", GameMaster.selected_unit)


func _on_archer_pressed() -> void:
	GameMaster.selected_unit = Archer
	print("selected unit:", GameMaster.selected_unit)

func _on_cavalry_pressed() -> void:
	GameMaster.selected_unit = Cavalry
	print("selected unit:", GameMaster.selected_unit)
