extends Control

var white = Color(1,1,1)
var black = Color(0,0,0)

signal aspect_change(is_mobile)

onready var anim = $AnimationPlayer

var is_mobile = false

func _ready() -> void:
	_light_mode()
	anim.current_animation = "show_home"
	_check_mobile()

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
	if !is_mobile:
		anim.current_animation = "show_info"

func _on_SkillsButton_mouse_entered() -> void:
	if !is_mobile:
		anim.current_animation = "show_skills"

func _on_ProjectButton_mouse_entered() -> void:
	if !is_mobile:
		anim.current_animation = "show_project"

func _on_ContactButton_mouse_entered() -> void:
	if !is_mobile:
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
	$Mobile/ContactCard/AnimationPlayer.current_animation = "copied"
	OS.set_clipboard("morneventer.mv@gmail.com")

func _on_Github_pressed() -> void:
	OS.shell_open("https://github.com/MorneVenter")

func _check_mobile():
	var viewport = get_viewport().size
	if viewport.y > viewport.x:
		_set_mobile()
		emit_signal("aspect_change", true)
		is_mobile = true
	else:
		_set_desktop()
		emit_signal("aspect_change", false)
		is_mobile = false

func _set_mobile():
	$AnimationPlayer.current_animation = "show_home"
	_show_home_mobile()
	$MenuContainer.columns = 2

func _set_desktop():
	$AnimationPlayer.current_animation = "show_home"
	_show_home_mobile()
	$MenuContainer.columns = 1

func _on_LandingPage_resized() -> void:
	_check_mobile()

func _show_info_mobile():
	$Mobile/InfoCard.visible = true
	$Mobile/SkillsCard.visible = false
	$Mobile/ProjectCard.visible = false
	$Mobile/ContactCard.visible = false

func _show_skills_mobile():
	$Mobile/InfoCard.visible = false
	$Mobile/SkillsCard.visible = true
	$Mobile/ProjectCard.visible = false
	$Mobile/ContactCard.visible = false

func _show_projects_mobile():
	$Mobile/InfoCard.visible = false
	$Mobile/SkillsCard.visible = false
	$Mobile/ProjectCard.visible = true
	$Mobile/ContactCard.visible = false

func _show_contact_mobile():
	$Mobile/InfoCard.visible = false
	$Mobile/SkillsCard.visible = false
	$Mobile/ProjectCard.visible = false
	$Mobile/ContactCard.visible = true

func _show_home_mobile():
	$Mobile/InfoCard.visible = false
	$Mobile/SkillsCard.visible = false
	$Mobile/ProjectCard.visible = false
	$Mobile/ContactCard.visible = false

func _on_HomeButton_pressed() -> void:
	if is_mobile:
		_show_home_mobile()

func _on_InfoButton_pressed() -> void:
	if is_mobile:
		_show_info_mobile()

func _on_SkillsButton_pressed() -> void:
	if is_mobile:
		_show_skills_mobile()

func _on_ProjectButton_pressed() -> void:
	if is_mobile:
		_show_projects_mobile()

func _on_ContactButton_pressed() -> void:
	if is_mobile:
		_show_contact_mobile()
