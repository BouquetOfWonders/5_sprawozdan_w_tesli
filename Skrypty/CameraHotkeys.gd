extends Node
@onready
var SoundEffect = $"../../../CamEnterExitEffect"
var rng = RandomNumberGenerator.new()

func _input(event):
	if GlobalVar.CanCameraMove:
		if event.is_action_pressed("CameraTypeChange"):
			if GlobalVar.CurrentCam == 1 or GlobalVar.CurrentCam == 2:
				GlobalVar.CanCameraMove = false
			GlobalVar.IsCameraOn = abs(GlobalVar.IsCameraOn -1)
			GlobalVar.CamUpdate = true
			SoundEffect.pitch_scale = rng.randf_range(0.9, 1.1)
			SoundEffect.play()
		if GlobalVar.IsCameraOn == 1:
		
			if event.is_action_pressed("Cam 1"):
				$"CameraLayout/1".button_pressed = true
				$"CameraLayout/1".emit_signal("pressed")

			elif event.is_action_pressed("Cam 2"):
				$"CameraLayout/2".button_pressed = true
				$"CameraLayout/2".emit_signal("pressed")

			elif event.is_action_pressed("Cam 3"):
				$"CameraLayout/3".button_pressed = true
				$"CameraLayout/3".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 4"):
				$"CameraLayout/4".button_pressed = true
				$"CameraLayout/4".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 5"):
				$"CameraLayout/5".button_pressed = true
				$"CameraLayout/5".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 6"):
				$"CameraLayout/6".button_pressed = true
				$"CameraLayout/6".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 7"):
				$"CameraLayout/7".button_pressed = true
				$"CameraLayout/7".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 8"):
				$"CameraLayout/8".button_pressed = true
				$"CameraLayout/8".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 9"):
				$"CameraLayout/9".button_pressed = true
				$"CameraLayout/9".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 10"):
				$"CameraLayout/10".button_pressed = true
				$"CameraLayout/10".emit_signal("pressed")
				
			elif event.is_action_pressed("Cam 11"):
				$"CameraLayout/11".button_pressed = true
				$"CameraLayout/11".emit_signal("pressed")
				
