extends Control
var globalvar = GlobalVar
@export var buttongroup: ButtonGroup

func _ready() -> void:
	for i in buttongroup.get_buttons():
		i.connect("pressed",Camchanged)

func Camchanged():
	globalvar.CurrentCam = int(buttongroup.get_pressed_button().name)
	GlobalVar.CamUpdate = true
	
