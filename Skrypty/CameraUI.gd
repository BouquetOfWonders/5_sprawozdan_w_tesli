extends Control
var Globalvar = GlobalVar
@onready
var Root = $"."
@onready
var CamButtonGroup = "res://Skrypty/Resources/CameraUIButtonGroup.tres"
enum {NoCam, Cam}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvar.IsCameraOn == Cam:
		Root.visible = true
	else:
		Root.visible = false
