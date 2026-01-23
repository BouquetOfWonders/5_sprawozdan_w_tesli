extends Control
var Globalvar = GlobalVar
@onready
var Root = $"."
@onready
var CamButtonGroup = "res://Skrypty/Resources/CameraUIButtonGroup.tres"
enum {NoCam, Cam}
@onready
var SoundEffect = $"../../CamEnterExitEffect"
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvar.IsCameraOn == Cam:
		Root.visible = true
	else:
		Root.visible = false


func _on_texture_button_button_down() -> void:
	GlobalVar.IsCameraOn = abs(GlobalVar.IsCameraOn -1)
	GlobalVar.CamUpdate = true
	GlobalVar.CanCameraMove = true
	SoundEffect.pitch_scale = rng.randf_range(0.9, 1.1)
	SoundEffect.play()
