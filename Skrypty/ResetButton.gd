extends Button
@onready
var Root = $"."
# Value is inversely proportional
var Blink := 0.0
var IsBlinkCharging := false
var IsGreen := false
var RedStylebox
var WasJustReset := false
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
	if Root.button_pressed == true and not WasJustReset:
		Blink += delta/3
		if Blink < 1:
			RedStylebox.bg_color = Color(Blink, 0.196, 0.196, 1.0)
		else:
			SaveData._reset()
			SaveData._fullLoad()
			$"../MasterVolume".value = 50
			$"../SFXVolume".value = 50
			$"../MusicVolume".value = 50
			$"../../MainMenu/Continue".disabled = true
			$"../../MainMenu/ThreatDocumentation".disabled = true
			$"../../MainMenu/NewCNGame".visible = false
			WasJustReset = true
	elif WasJustReset and Root.button_pressed == true:
		RedStylebox.bg_color = Color(0.196, 1.0, 0.196, 1.0)
	else:
		WasJustReset = false
		Blink = 0
		RedStylebox.bg_color = Color(0.196, 0.196, 0.196, 1.0)
