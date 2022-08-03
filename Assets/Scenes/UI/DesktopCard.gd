extends Control


var white = Color(1,1,1)
var black = Color(0,0,0)

func _ready() -> void:
	_light_mode()

func _dark_mode() -> void:
	$Background.modulate = black
	$Text.modulate = white

func _light_mode() -> void:
	$Background.modulate = white
	$Text.modulate = black

func _on_DarkModeCheck_toggled(button_pressed: bool) -> void:
	if button_pressed:
		_light_mode()
	else:
		_dark_mode()
