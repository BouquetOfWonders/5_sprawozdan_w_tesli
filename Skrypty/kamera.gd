extends Camera2D
enum {NoCam, Cam}
var Globalvar = GlobalVar
@onready
var Kamera = $"."
var CamPosition := 0.0
var CamSpeed := 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globalvar.IsCameraOn == Cam && abs(Kamera.position.x - CamPosition) > 5:
		Kamera.position_smoothing_enabled = false
		if Kamera.position.x > CamPosition:
			Kamera.position.x -= CamSpeed * delta
		elif Kamera.position.x < CamPosition:
			Kamera.position.x += CamSpeed * delta
	else:
		Kamera.position_smoothing_enabled = true

func _input(event):
	if event is InputEventMouseMotion:
		var TruePosition = clamp(event.position.x, 0, 1280) / 2
		if Globalvar.IsCameraOn == NoCam:
			Kamera.position_smoothing_enabled = true
			Kamera.position.x = TruePosition - 320
		else:
			CamPosition = TruePosition - 320
	if event.is_action_pressed("CameraTypeChange"):
		Globalvar.CamTransision = true
		Globalvar.IsCameraOn = abs(Globalvar.IsCameraOn -1)
			
			
		
		
