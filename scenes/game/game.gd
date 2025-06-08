extends Control

@onready var left_hud    = $LeftBackground
@onready var right_hud   = $RightBackground

func _ready():
	update_layout()
	get_viewport().connect("size_changed", Callable(self, "update_layout"))

func update_layout():
	var screen_size = DisplayServer.window_get_size()
	
	var half_width = screen_size.x / 2.0
	
	# Layout HUDs
	left_hud.position = Vector2(0, 0)
	left_hud.custom_minimum_size = Vector2(half_width, screen_size.y)

	right_hud.position = Vector2(half_width, 0)
	right_hud.custom_minimum_size = Vector2(half_width, screen_size.y)
	
	 # Print debug info
	print("Screen Size: ", screen_size)
	print("LeftHUD Pos: ", left_hud.position, " Size: ", left_hud.size)
	print("RightHUD Pos: ", right_hud.position, " Size: ", right_hud.size)
	
