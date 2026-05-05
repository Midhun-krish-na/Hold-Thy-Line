extends Node2D

const unit_scene = preload("res://scene/unit.tscn")

func _ready() -> void:
	GameMaster.unit_scene = unit_scene
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("deploy") :
		GameMaster.attempt_to_spawn(get_global_mouse_position())
