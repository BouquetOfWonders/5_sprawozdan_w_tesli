extends Node


const saveLocation = "user://save.save"

var Contents: Dictionary = {
	"language": "en",
	"currentNight": 0,
	"isCNunlocked": false,
	
	"etherCounter": 0,
	"analougeCounter": 0,
	"servoCounter": 0,
	"randyCounter": 0,
	"bbgCounter": 0
	
}

func _save():
	var file = FileAccess.open(saveLocation, FileAccess.WRITE)
	file.store_var(Contents.duplicate())
	file.close()

func _load():
	if FileAccess.file_exists(saveLocation):
		var file = FileAccess.open(saveLocation, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var saveData = data.duplicate()
		Contents.language = saveData.language
		
		Contents.currentNight = saveData.currentNight
		Contents.isCNunlocked = saveData.isCNunlocked
		
		Contents.etherCounter = saveData.etherCounter
		Contents.analougeCounter = saveData.analougeCounter
		Contents.servoCounter = saveData.servoCounter
		Contents.randyCounter = saveData.randyCounter
		Contents.bbgCounter = saveData.bbgCounter
		
func _ready() -> void:
	_load()
	TranslationServer.set_locale(Contents.language)
