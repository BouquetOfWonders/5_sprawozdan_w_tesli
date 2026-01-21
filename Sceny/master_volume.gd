extends HScrollBar

@onready
var Root = $"."
@onready
var Audio = $"../../AudioStreamPlayer"
var busindex: int
@export
var busname: String

var CanPlay := false

func _ready() -> void:
	busindex = AudioServer.get_bus_index(busname)
	value_changed.connect(_on_value_changed)
	Root.value = db_to_linear(SaveData.Contents.get(busname)) * 50
	CanPlay = true
	


@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		busindex,
		linear_to_db(value/50)
	)
	Audio.bus = busname
	if CanPlay:
		Audio.play()
		await Audio.finished
	Audio.bus = "SoundEffects"
	SaveData.Contents.set(busname, linear_to_db(value/50))
	SaveData._save()
	
