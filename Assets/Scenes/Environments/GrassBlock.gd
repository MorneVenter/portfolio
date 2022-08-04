extends Spatial

export(Vector2) var max_y_rotation = Vector2(-10, 10)
export(Vector2) var max_x_rotation = Vector2(-10, 10)

onready var grass := $GrassBase

func _process(delta: float) -> void:
	_look_at_mouse(delta)

func _look_at_mouse(delta: float):
	var mouse_pos := get_viewport().get_mouse_position()
	var screen_size : Vector2 = get_viewport().size
	var x_offset : float = mouse_pos.x / screen_size.x
	var y_offset : float = mouse_pos.y / screen_size.y

	var x_rotaton : float = max_x_rotation.y - ((max_x_rotation.y - max_x_rotation.x) * x_offset)
	var y_rotaton : float = max_y_rotation.y - ((max_y_rotation.y - max_y_rotation.x) * y_offset)

	grass.rotation_degrees = Vector3(clamp(x_rotaton, max_x_rotation.x, max_x_rotation.y), clamp(y_rotaton, max_y_rotation.x, max_y_rotation.y), 0)
