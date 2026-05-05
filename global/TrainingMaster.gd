extends Node

signal army_changed
signal to_train

var army_in_queue: Array[UnitStats] =[]
var current_cook_time: float = 0.0
var current_unit_max_time: float = 1.0 
var army_ready_for_battle:Dictionary = {"Infantry": 0, "Archer": 0, "Cavalry": 0}
var army_in_queue_count:Dictionary = {"Infantry": 0, "Archer": 0, "Cavalry": 0}
var max_count:int = 10
var count:int

#region train troop
func train_troop(Troop: UnitStats):
	if count < max_count:
		army_in_queue.append(Troop)
		var unit_name = Troop.unit_name
		army_in_queue_count[unit_name] = army_in_queue_count.get(unit_name,0) +1
		count+=1
		to_train.emit()
	
		if army_in_queue.size() == 1:
			current_cook_time = Troop.train_time
	else:
		print("Max army size reached:")

#endregion



func _process(delta: float) -> void:
	if army_in_queue.is_empty():
		return

	current_cook_time -= delta
	if current_cook_time <= 0:
		finish_cook()


#region After Cooking
func finish_cook():
	var leftover = current_cook_time
	var finished_troop = army_in_queue.pop_front()
	var troop_name = finished_troop.unit_name
	army_ready_for_battle[troop_name] = army_ready_for_battle.get(troop_name,0) +1
	army_in_queue_count[troop_name] = army_in_queue_count.get(troop_name,0) -1
	print("Finished training: ", troop_name, " Total: ", army_ready_for_battle[troop_name])

	to_train.emit()
	army_changed.emit()

	if not army_in_queue.is_empty():
		_start_cooking(army_in_queue[0])
		current_cook_time += leftover 
	else:
		current_cook_time = 0.0


func _start_cooking(troop: UnitStats):
	current_cook_time = troop.train_time
	current_unit_max_time = troop.train_time
#endregion



#region signal pass
func get_infantry_count():
	return army_ready_for_battle["Infantry"]

func get_archer_count():
	return army_ready_for_battle["Archer"]

func get_cavalry_count():
	return army_ready_for_battle["Cavalry"]




func get_infantry_to_train():
	return army_in_queue_count["Infantry"]

func get_archer_to_train():
	return army_in_queue_count["Archer"]

func get_cavalry_to_train():
	return army_in_queue_count["Cavalry"]
#endregion




#region troop update after placement
func try_to_place_unit(troop_selected: UnitStats):
	if troop_selected != null:
		var troop_name = troop_selected.unit_name
		if army_ready_for_battle.has(troop_name) and army_ready_for_battle[troop_name] > 0:
			army_ready_for_battle[troop_name] -= 1
			count-=1
			return true
	
		return false
		
#endregion
