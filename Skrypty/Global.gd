extends Node
enum {NoCam, Cam}
var IsCameraOn := NoCam
var CamTransision := false
var CamUpdate := false

var CurrentCam := 1

var Room1State := 0


func _input(event):
	if event.is_action_pressed("statechangedebug"):
		Room1State += 1
		if IsCameraOn == Cam and CurrentCam == 1:
			CamUpdate = true
		
