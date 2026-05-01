@tool class_name Perk extends Control

@onready var image: TextureRect = $PanelContainer/MarginContainer/VBoxContainer/Image
@onready var title: Label = $PanelContainer/MarginContainer/VBoxContainer/Title
@onready var description: Label = $PanelContainer/MarginContainer/VBoxContainer/Description

@export var tool_image: TextureRect:
	set(val):
		tool_image = val
		image = val

@export var tool_title: String:
	set(val):
		tool_title = val
		title.text = val

@export var tool_description: String:
	set(val):
		tool_description = val
		description.text = val
