class_name UI_manager extends Node

@export var builds_button: Button
@export var building_menu: Building_menu

func _ready() -> void:
	building_menu.visible = false

	if builds_button and !builds_button.pressed.is_connected(building_button_pressed):
		builds_button.pressed.connect(building_button_pressed)

func building_button_pressed() -> void:
	if building_menu.visible == true:
		building_menu.visible = false
	else:
		building_menu.visible = true
