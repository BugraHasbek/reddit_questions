extends Camera2D

const SCROLL_SPEED : float = 40.0  # pixels per second

func _process(delta: float) -> void:
	position.y -= SCROLL_SPEED * delta
