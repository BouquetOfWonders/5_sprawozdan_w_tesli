extends Button

@onready
var Root = $"."
var RedStylebox
var IsColored := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RedStylebox = Root.get_theme_stylebox("normal").duplicate()
	RedStylebox.bg_color = Color(1, 0.196, 0.196, 1.0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.CurrentCam == 2:
		Root.visible = true
		if Root.button_pressed:
			GlobalVar.IsModemOn = false
			Root.text = "OFF"
			if not IsColored:
				Root.add_theme_stylebox_override("hover", RedStylebox)
				Root.add_theme_stylebox_override("normal", RedStylebox)
				Root.add_theme_stylebox_override("pressed", RedStylebox)
				Root.add_theme_stylebox_override("focus", RedStylebox)
				IsColored = true
		else:
			GlobalVar.IsModemOn = true
			Root.text = "ON"
			if IsColored:
				Root.remove_theme_stylebox_override("normal")
				Root.remove_theme_stylebox_override("hover")
				Root.remove_theme_stylebox_override("pressed")
				Root.remove_theme_stylebox_override("focus")
				IsColored = false
	else:
		Root.visible = false
