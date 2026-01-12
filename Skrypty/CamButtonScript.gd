extends Button
@onready
var Root = $"."
# Value is inversely proportional
const Speed = 100.0
var Blink := Speed
var IsBlinkCharging := false
var IsGreen := false
var GreenStylebox
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GreenStylebox = Root.get_theme_stylebox("normal").duplicate()
	GreenStylebox.bg_color = Color(0.196, 1.0, 0.196, 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Root.button_pressed == true:
		if Blink > 0 and IsBlinkCharging == false:
			Blink -= 100 * delta
			if IsGreen == false:
				Root.add_theme_stylebox_override("hover", GreenStylebox)
				Root.add_theme_stylebox_override("normal", GreenStylebox)
				Root.add_theme_stylebox_override("pressed", GreenStylebox)
				Root.add_theme_stylebox_override("focus", GreenStylebox)
				IsGreen = true
		elif IsBlinkCharging:
			if Blink < Speed:
				Blink += 100 * delta
			else:
				IsBlinkCharging = false
		elif IsBlinkCharging == false:
			IsBlinkCharging = true
			if IsGreen:
				Root.remove_theme_stylebox_override("normal")
				Root.remove_theme_stylebox_override("hover")
				Root.remove_theme_stylebox_override("pressed")
				Root.remove_theme_stylebox_override("focus")
				IsGreen = false
	else:
		if IsGreen:
			Root.remove_theme_stylebox_override("normal")
			Root.remove_theme_stylebox_override("hover")
			Root.remove_theme_stylebox_override("pressed")
			Root.remove_theme_stylebox_override("focus")
			IsGreen = false
		Blink = Speed
