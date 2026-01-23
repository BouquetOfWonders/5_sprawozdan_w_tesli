extends Button
@onready
var Root = $"."
var PressedFor := 0.0
var ShouldLetGo := false

var RedStylebox

func _ready() -> void:
	RedStylebox = Root.get_theme_stylebox("normal").duplicate()
	RedStylebox.bg_color = Color(1, 0, 0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Root.button_pressed:
		if PressedFor > 1 and not GlobalVar.DeconTimeout:
			PressedFor = 0
			ShouldLetGo = true
			GlobalVar.VentDecontamination = true
			GlobalVar.VentDecontID = int(Root.name)
			GlobalVar.DeconTimeout = true
			Root.add_theme_stylebox_override("hover", RedStylebox)
			Root.add_theme_stylebox_override("normal", RedStylebox)
			Root.add_theme_stylebox_override("pressed", RedStylebox)
			Root.add_theme_stylebox_override("focus", RedStylebox)
			await get_tree().create_timer(3).timeout
			Root.remove_theme_stylebox_override("normal")
			Root.remove_theme_stylebox_override("hover")
			Root.remove_theme_stylebox_override("pressed")
			Root.remove_theme_stylebox_override("focus")
			GlobalVar.DeconTimeout = false
		elif ShouldLetGo:
			pass
		else:
			PressedFor += delta 
	elif PressedFor > 0 and not ShouldLetGo:
		PressedFor = 0
		GlobalVar.TripwireID = int(Root.name)
	elif ShouldLetGo:
		ShouldLetGo = false
