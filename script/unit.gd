extends CharacterBody2D
class_name unit

var Unit_stats : UnitStats

func initialize(data: UnitStats):
	Unit_stats = data
	print("I am now a ", data.unit_name)
