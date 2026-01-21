extends Button
@onready
var Root = $"."
# Value is inversely proportional
var Blink := 0.0
var IsBlinkCharging := false
var IsGreen := false
var RedStylebox
var IsLoading := false
var I := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RedStylebox = Root.get_theme_stylebox("normal").duplicate()
	Root.add_theme_stylebox_override("hover", RedStylebox)
	Root.add_theme_stylebox_override("normal", RedStylebox)
	Root.add_theme_stylebox_override("pressed", RedStylebox)
	Root.add_theme_stylebox_override("focus", RedStylebox)
	RedStylebox.bg_color = Color(0.196, 0.196, 0.196, 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Root.button_pressed == true and I == 0 and not IsLoading:
		Blink += delta/1.5
		if Blink < 1:
			RedStylebox.bg_color = Color(0.196, Blink, 0.196, 1.0)
		else:
			SaveData.Contents.currentNight = 0
			SaveData._save()
			$"../../BlackScreen".visible = true
			IsLoading = true
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif IsLoading:
		I += delta
		$"../../BlackScreen".self_modulate = Color(1.0, 1.0, 1.0, I)
		if I > 1:
			get_tree().change_scene_to_file("res://Sceny/gameplay.tscn")
	else:
		Blink = 0
		RedStylebox.bg_color = Color(0.196, 0.196, 0.196, 1.0)
