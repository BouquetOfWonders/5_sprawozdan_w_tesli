extends Control
var globalvar = GlobalVar
@export var buttongroup: ButtonGroup
@onready
var SoundEffect = $"../../../../CamSwitchEffect"
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	for i in buttongroup.get_buttons():
		i.connect("pressed",Camchanged)
		

func Camchanged():
	globalvar.CurrentCam = int(buttongroup.get_pressed_button().name)
	GlobalVar.CamUpdate = true
	if GlobalVar.IsCameraOn == 1:
		SoundEffect.pitch_scale = rng.randf_range(0.9, 1.1)
		SoundEffect.play()
	
	
