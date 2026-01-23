extends Node


const saveLocation = "user://save.save"
static var Defaults: Dictionary = {
	"language": "en",
	"Master": linear_to_db(1),
	"Music": linear_to_db(1),
	"SoundEffects": linear_to_db(1),
	
	"currentNight": 0,
	"isCNunlocked": false,
	
	"etherCounter": 0,
	"analougeCounter": 0,
	"servoCounter": 0,
	"randyCounter": 0,
	"bbgCounter": 0
	
}

var Contents: Dictionary

func _reset():
	var file = FileAccess.open(saveLocation, FileAccess.WRITE)
	file.store_var(Defaults.duplicate())
	file.close()

func _save():
	var file = FileAccess.open(saveLocation, FileAccess.WRITE)
	file.store_var(Contents.duplicate())
	file.close()

func _load():
	if not FileAccess.file_exists(saveLocation):
		_reset()
	var file = FileAccess.open(saveLocation, FileAccess.READ)
	var data = file.get_var()
	file.close()
		
	Contents = data.duplicate()
		
func _fullLoad():
	_load()
	TranslationServer.set_locale(Contents.language)
	var busindex = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(
		busindex,
		Contents.Master
	)
	busindex = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(
		busindex,
		Contents.Music
	)
	busindex = AudioServer.get_bus_index("SoundEffects")
	AudioServer.set_bus_volume_db(
		busindex,
		Contents.SoundEffects
	)

func _ready() -> void:
	_fullLoad()
