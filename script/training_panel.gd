extends Control

@export var infantry_data: UnitStats
@export var archer_data: UnitStats
@export var cavalry_data: UnitStats

@export_file("*.tscn") var previous_scene_path: String = "res://scene/home_ui.tscn"


#Trained troops
@onready var infantry_count: Label = $HeaderBox/TroopCounter/InfantryCount
@onready var archer_count: Label = $HeaderBox/TroopCounter/ArcherCount
@onready var cavalry_count: Label = $HeaderBox/TroopCounter/CavalryCount

#to Train/Cook
@onready var infantry_s: Label = $HeaderBox/CookingBox/CookingCount/InfantryS
@onready var archer_s: Label = $HeaderBox/CookingBox/CookingCount/ArcherS
@onready var cavalry_s: Label = $HeaderBox/CookingBox/CookingCount/CavalryS



func _ready() -> void:
	TrainingMaster.army_changed.connect(refresh_labels)
	refresh_labels()
	TrainingMaster.to_train.connect(refresh_cook_counter)
	refresh_cook_counter()


#region Updates_after_signals
func refresh_labels() -> void:
	infantry_count.text = str("Infantry: ", TrainingMaster.get_infantry_count())
	archer_count.text = str("Archer: ", TrainingMaster.get_archer_count())
	cavalry_count.text = str("Cavalry: ", TrainingMaster.get_cavalry_count())

func refresh_cook_counter() -> void:
	infantry_s.text = str("Infantry: ", TrainingMaster.get_infantry_to_train())
	archer_s.text = str("Archer: ", TrainingMaster.get_archer_to_train())
	cavalry_s.text = str("Cavalry: ", TrainingMaster.get_cavalry_to_train())
#endregion


#region button_Trigger
func _on_infantry_train_pressed() -> void:
	TrainingMaster.train_troop(infantry_data)

func _on_archer_train_pressed() -> void:
	TrainingMaster.train_troop(archer_data)

func _on_cavalry_train_pressed() -> void:
	TrainingMaster.train_troop(cavalry_data)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(previous_scene_path)

#endregion
