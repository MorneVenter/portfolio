extends Control

var white = Color(1,1,1)
var black = Color(0,0,0)

onready var anim = $AnimationPlayer

func _ready() -> void:
	_light_mode()
	anim.current_animation = "show_home"

func _dark_mode() -> void:
	$Header.modulate = black
	$Border.modulate = black
	$MenuContainer.modulate = black

func _light_mode() -> void:
	$Header.modulate = white
	$Border.modulate = white
	$MenuContainer.modulate = white

func _on_CheckButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		_light_mode()
	else:
		_dark_mode()

func _on_HomeButton_mouse_entered() -> void:
	anim.current_animation = "show_home"

func _on_InfoButton_mouse_entered() -> void:
	anim.current_animation = "show_info"

func _on_SkillsButton_mouse_entered() -> void:
	anim.current_animation = "show_skills"

func _on_ProjectButton_mouse_entered() -> void:
	anim.current_animation = "show_project"

func _on_ContactButton_mouse_entered() -> void:
	anim.current_animation = "show_contact"

func _on_EmberButton_pressed() -> void:
	OS.shell_open("https://store.steampowered.com/app/1848860/Ember_Crusade_IV/")

func _on_DigitonButton_pressed() -> void:
	OS.shell_open("https://store.steampowered.com/app/1296860/Enter_Digiton/")

func _on_Twitter_pressed() -> void:
	OS.shell_open("https://twitter.com/MelktertMan")

func _on_Linkedin_pressed() -> void:
	OS.shell_open("https://www.linkedin.com/in/morne-venter-611379194/")

func _on_Copy_pressed() -> void:
	_copy_email()

func _on_EmailButton_pressed() -> void:
	_copy_email()

func _copy_email():
	$ContactCard/AnimationPlayer.current_animation = "copied"
	OS.set_clipboard("morneventer.mv@gmail.com")

func _on_Github_pressed() -> void:
	OS.shell_open("https://github.com/MorneVenter")
