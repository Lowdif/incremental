class_name Game_manager extends Node

enum PLAYER_MODES {
	NORMAL,
	SELECTING,
	PLACING,
	DELETING,
	UPGRADING
}

const CAMERA_MOVE_SPEED: float = 5.0
const MOVE_TRESHOLD: float = 0.5
const CAMERA_ZOOM_SPEED: Vector2 = Vector2(0.1, 0.1)
const CAMERA_ZOOM_LIMIT: Vector2 = Vector2(0.1, 5.0)

@export var world_camera: Camera2D
@export var ui_manager: UI_manager

var current_mode: PLAYER_MODES = PLAYER_MODES.NORMAL

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	ui_manager.building_menu.building_selected.connect(building_selected)

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var dir: Vector2 = Input.get_last_mouse_screen_velocity().normalized()
		if dir.length() < MOVE_TRESHOLD: return
		
		var zoom_factor: Vector2 = Vector2(1.0, 1.0) / world_camera.zoom
		world_camera.global_position -= dir * CAMERA_MOVE_SPEED * zoom_factor
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		world_camera.zoom = (world_camera.zoom - CAMERA_ZOOM_SPEED).clampf(CAMERA_ZOOM_LIMIT[0], CAMERA_ZOOM_LIMIT[1])
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		world_camera.zoom = (world_camera.zoom + CAMERA_ZOOM_SPEED).clampf(CAMERA_ZOOM_LIMIT[0], CAMERA_ZOOM_LIMIT[1])

func building_selected(building: Building) -> void:
	current_mode = PLAYER_MODES.PLACING
