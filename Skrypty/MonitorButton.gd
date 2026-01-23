extends TextureButton
@onready
var Root = $"."
@onready
var SoundEffect = $"../CamEnterExitEffect"
var rng = RandomNumberGenerator.new()

func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == 0:
		Root.visible = true
	else:
		Root.visible = false



func _on_button_down() -> void:
	if GlobalVar.CurrentCam == 1 or GlobalVar.CurrentCam == 2:
		GlobalVar.CanCameraMove = false
	GlobalVar.IsCameraOn = abs(GlobalVar.IsCameraOn -1)
	GlobalVar.CamUpdate = true
	SoundEffect.pitch_scale = rng.randf_range(0.9, 1.1)
	SoundEffect.play()
