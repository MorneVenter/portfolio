extends Spatial

func _set_dekstop_position():
	$GrassBlock.translation = Vector3(26.082, -8.244, 158.137)

func _set_mobile_position():
	$GrassBlock.translation = Vector3(0, 5, 60)


func _on_LandingPage_aspect_change(is_mobile) -> void:
	if is_mobile:
		_set_mobile_position()
	else:
		_set_dekstop_position()
