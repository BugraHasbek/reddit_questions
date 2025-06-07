extends Control

const LOGICAL_WIDTH :float  = 240.0
const LOGICAL_HEIGHT: float = 320.0
const ASPECT: float         = LOGICAL_WIDTH / LOGICAL_HEIGHT

@onready var left_hud    = $HBoxContainer/LeftHUD
@onready var right_hud   = $HBoxContainer/RightHUD
@onready var game_display = $HBoxContainer/GameDisplay

func _ready():
	#update_layout()
	#get_viewport().connect("size_changed", Callable(self, "update_layout"))
	pass

func update_layout():
	var screen_size = DisplayServer.window_get_size()
	var max_game_height = screen_size.y
	var max_game_width = max_game_height * ASPECT
	
	# Clamp game area width to screen width
	if max_game_width > screen_size.x:
		max_game_width = screen_size.x
		max_game_height = max_game_width / ASPECT

	var center_x = screen_size.x / 2.0
	var center_y = screen_size.y / 2.0
	var game_rect = Rect2(
		Vector2(center_x - max_game_width / 2.0, center_y - max_game_height / 2.0),
		Vector2(max_game_width, max_game_height)
	)

	# Layout GameDisplay
	game_display.position = game_rect.position
	game_display.size = game_rect.size
	game_display.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT

	# Layout HUDs
	var left_width  = game_rect.position.x
	var right_x     = game_rect.position.x + game_rect.size.x
	var right_width = screen_size.x - right_x

	left_hud.position = Vector2(0, 0)
	left_hud.size = Vector2(left_width, screen_size.y)

	right_hud.position = Vector2(right_x, 0)
	right_hud.size = Vector2(right_width, screen_size.y)
	
	
	left_hud.add_theme_color_override("panel", Color(1, 0, 0, 0.25))
	right_hud.add_theme_color_override("panel", Color(0, 0, 1, 0.25))
	
	 # Print debug info
	print("Screen Size: ", screen_size)
	print("GameDisplay Pos: ", game_display.position, " Size: ", game_display.size)
	print("LeftHUD Pos: ", left_hud.position, " Size: ", left_hud.size)
	print("RightHUD Pos: ", right_hud.position, " Size: ", right_hud.size)
	
	print("Max game width: ", max_game_width, " Max game height: ", max_game_height)
	print('Center X: ', center_x, " Center Y: ", center_y)
