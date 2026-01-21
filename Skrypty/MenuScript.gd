extends Control

@onready
var Audio = $AudioStreamPlayer

func _ready() -> void:
	if SaveData.Contents.currentNight != 0:
		$MainMenu/Continue.disabled = false
	if SaveData.Contents.etherCounter != 0 or SaveData.Contents.analougeCounter != 0 or SaveData.Contents.servoCounter != 0 or SaveData.Contents.randyCounter != 0 or SaveData.Contents.bbgCounter != 0: 
		$MainMenu/ThreatDocumentation.disabled = false
	if SaveData.Contents.isCNunlocked:
		$MainMenu/NewCNGame.visible = true


func _on_continue_button_down() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$BlackScreen.visible = true
	for I in 60:
		$BlackScreen.self_modulate = Color(1.0, 1.0, 1.0, float(I)/60)
		await get_tree().process_frame
	get_tree().change_scene_to_file("res://Sceny/gameplay.tscn")


func _on_options_button_down() -> void:
	$MainMenu.visible = false
	$OptionsMenu.visible = true
	Audio.play()



func _on_threat_documentation_button_down() -> void:
	Audio.play()



func _on_exit_button_down() -> void:
	get_tree().quit()



func _on_go_back_button_down() -> void:
	$MainMenu.visible = true
	$OptionsMenu.visible = false
	Audio.play()



func _on_language_pressed() -> void:
	if TranslationServer.get_locale() == "en":
		TranslationServer.set_locale("pl")
		SaveData.Contents.language = "pl"
		SaveData._save()
	else:
		TranslationServer.set_locale("en")
		SaveData.Contents.language = "en"
		SaveData._save()
	Audio.play()

func _on_new_cn_game_button_down() -> void:
	Audio.play()
