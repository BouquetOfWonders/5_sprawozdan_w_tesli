extends Node
enum {NoCam, Cam}
var IsCameraOn := NoCam
var CamTransision := false
var CamUpdate := false
var ForceNoCamTransision := false

var MenuCamTransision := false

var CanCameraMove := false

var CurrentCam := 3

var IsModemOn := true

var VentDecontamination := false
var VentDecontID := 0
var DeconTimeout := false
var TripwireID := 0

var RandyAI := 0
var ServoAI := 0
var AnalougeAI := 10
var EtherAi := 10
var BbgAI := 0

var DayMultiplier := 1.0
var IsEndless := false

var IsDoorClosed := false
var Room0State := 0
var Room1State := 0
var Room2State := 0
var Room3State := 0
var Room4State := 0
var Room5State := 0
var Room6State := 0
var Room7State := 0
var Room8State := 0
var Room9State := 0
var Room10State := 0
var Room11State := 0



func _input(event):
	if event.is_action_pressed("statechangedebug"):
		Room2State += 1
		if IsCameraOn == Cam and CurrentCam == 2:
			ForceNoCamTransision = true
			CamUpdate = true

		
		
		
