class_name Building_menu extends Control

@export var cells: Array[Building_menu_button]

signal building_selected(building: Building)

func _ready() -> void:
	for btn in cells:
		btn.was_pressed.connect(menu_button_pressed)

func menu_button_pressed(building: Building) -> void:
	if !building: return
	building_selected.emit(building)
