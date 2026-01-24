extends Node

var rng = RandomNumberGenerator.new()
@onready
var Vents: Array = [
	$SFX/Vent1,
	$SFX/Vent2,
	$SFX/Vent3,
	$SFX/Vent4,
	$SFX/Vent5,
	$SFX/Vent6
]

@onready
var SwitchCamSFX = $"../CamEnterExitEffect"

var RoomStates := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

var PreviousCamState := 0

var BBGTimer := 0.0

var EtherTimer: float = 60 + rng.randf_range(0, 20) - GlobalVar.EtherAi
var EtherMaxTimer := EtherTimer
var EtherOtherTimer := 0.0
# Since Ether moves in a straight line not much logic is needed besides values from 0 to 5
var EtherPosition := 0

var AnalougeTimer := 7.5
# X for room, Y for Floor
var AnalougePosition := Vector2i(0, 2)
var AnalougePreviousPosition := Vector2i(9, 9)
var ServoTimer := 8.0
# X for room, Y for Floor
var ServoPosition := Vector2i(0, 5)
var RandyTimer := 8.5
# X for room, Y for Room, Z for Corridor/Vent
var RandyPosition := Vector3i(2, 1, 0)

var DayTimer := 0.0
var MaxDayTimer := 480.0

var DayStarted := false

func _process(delta: float) -> void:
	if DayStarted:
		
		BBGTimer -= delta
		EtherTimer -= delta
		AnalougeTimer -= delta
		ServoTimer -= delta
		RandyTimer -= delta
		if GlobalVar.EtherAi > 0:
			Etherprocessing()
		if not GlobalVar.IsModemOn:
			EtherOtherTimer += delta
		else:
			EtherOtherTimer = 0
		if GlobalVar.IsEndless:
			pass
		else:
			DayTimer += delta
		BBGprocessing()
		if GlobalVar.AnalougeAI != 0:
			Analougeprocessing()
		Servoprocessing()
		Randyprocessing()
		CameraUpdater()


func BBGprocessing():
	pass
func Etherprocessing():
	if EtherPosition == 0:
		var Progress = EtherTimer / EtherMaxTimer
		if Progress > 0.9:
			GlobalVar.Room2State = 0
		elif Progress > 0.8:
			GlobalVar.Room2State = 1
		elif Progress > 0.7:
			GlobalVar.Room2State = 2
		elif Progress > 0.6:
			GlobalVar.Room2State = 3
		elif Progress > 0.5:
			GlobalVar.Room2State = 4
		elif Progress > 0.4:
			GlobalVar.Room2State = 5
		elif Progress > 0.3:
			GlobalVar.Room2State = 6
		elif Progress > 0:
			GlobalVar.Room2State = 7
		else:
			EtherPosition = 1
			GlobalVar.Room2State = 8
			EtherTimer = 3
			Vents.pick_random().play()
		
		if EtherOtherTimer > 3 + (float(GlobalVar.EtherAi)/10) and GlobalVar.IsModemOn:
			EtherMaxTimer = 60 + rng.randf_range(0, 20) - GlobalVar.EtherAi
			EtherTimer = EtherMaxTimer
		if EtherOtherTimer > 10 + (float(GlobalVar.EtherAi)/10):
			EtherPosition = 1
			GlobalVar.Room2State = 8
			EtherTimer = 1
			Vents.pick_random().play()
			
		if GlobalVar.IsCameraOn == GlobalVar.Cam and GlobalVar.CurrentCam == 2 and PreviousCamState != GlobalVar.Room2State:
			if not GlobalVar.IsModemOn:
				GlobalVar.ForceNoCamTransision = true
			GlobalVar.CamUpdate = true
		PreviousCamState = GlobalVar.Room2State
	else:
		if EtherTimer < 0 and (80 + GlobalVar.EtherAi) > rng.randi_range(0, 100):
			if EtherPosition != 5:
				EtherTimer = 1
				Vents.pick_random().play()
				EtherPosition += 1
			else:
				JumpscareHandler(1)
				DayStarted = false
		elif EtherTimer < 0 and EtherPosition != 5:
			EtherTimer = 1
		if GlobalVar.VentDecontamination and EtherPosition == GlobalVar.VentDecontID - 4:
			EtherPosition = 0
			EtherMaxTimer = 90 + rng.randf_range(0, 20) - GlobalVar.EtherAi
			EtherTimer = EtherMaxTimer
			EtherOtherTimer = 0

func Analougeprocessing():
	if AnalougeTimer < 0:
		AnalougeTimer = 7.5
		if GlobalVar.AnalougeAI >= rng.randi_range(0, 20):
			AnalougePreviousPosition = AnalougePosition
			if AnalougePosition == Vector2i(2, 0):
				if (5 + GlobalVar.AnalougeAI) >= rng.randi_range(0, 10):
					if not GlobalVar.IsDoorClosed:
						JumpscareHandler(2)
					else:
						AnalougePosition = Vector2i(randi_range(0, 1), 2)
						$"../DoorButton/DoorPitchedDown".play(0.18)
			elif AnalougePosition.y == 0 and AnalougePosition.x != 2:
				AnalougePosition.x += 1
			elif (50 + GlobalVar.AnalougeAI) >= rng.randi_range(0, 100) and AnalougePosition != Vector2i(2, 0):
					AnalougePosition.y -= 1
			else:
				AnalougePosition.x = abs(AnalougePosition.x - 1)
func Servoprocessing():
	pass
func Randyprocessing():
	pass
func CameraUpdater():
	
	GlobalVar.Room1State = 0
	GlobalVar.Room3State = 0
	GlobalVar.Room4State = 0
	GlobalVar.Room5State = 0
	GlobalVar.Room6State = 0
	GlobalVar.Room7State = 0
	GlobalVar.Room8State = 0
	GlobalVar.Room9State = 0
	GlobalVar.Room10State = 0
	
	if GlobalVar.AnalougeAI != 0:
		GlobalVar.Room11State = 0
		match AnalougePosition:
			Vector2i(0, 2):
				GlobalVar.Room3State = 1
				updateCam(3, 1)
			Vector2i(1, 2):
				GlobalVar.Room4State = 1
				updateCam(4, 1)
			Vector2i(0, 1):
				GlobalVar.Room5State = 1
				updateCam(5, 1)
			Vector2i(1, 1):
				GlobalVar.Room6State = 1
				updateCam(6, 1)
			Vector2i(0, 0):
				GlobalVar.Room7State = 1
				updateCam(7, 1)
			Vector2i(1, 0):
				GlobalVar.Room8State = 1
				updateCam(8, 1)
			Vector2i(2, 0):
				GlobalVar.Room9State = 1
				updateCam(9, 1)
		match AnalougePreviousPosition:
			Vector2i(0, 2):
				GlobalVar.Room3State = 0
				updateCam(3, 0)
			Vector2i(1, 2):
				GlobalVar.Room4State = 0
				updateCam(4, 0)
			Vector2i(0, 1):
				GlobalVar.Room5State = 0
				updateCam(5, 0)
			Vector2i(1, 1):
				GlobalVar.Room6State = 0
				updateCam(6, 0)
			Vector2i(0, 0):
				GlobalVar.Room7State = 0
				updateCam(7, 0)
			Vector2i(1, 0):
				GlobalVar.Room8State = 0
				updateCam(8, 0)
			Vector2i(2, 0):
				GlobalVar.Room9State = 0
				updateCam(9, 0)


func JumpscareHandler(WhichAnimatronic: int):
	print("JUMPSCARE!")
	print(WhichAnimatronic)
	if GlobalVar.IsCameraOn == GlobalVar.Cam:
		GlobalVar.IsCameraOn = GlobalVar.NoCam
		GlobalVar.CamUpdate = true
		SwitchCamSFX.pitch_scale = rng.randf_range(0.9, 1.1)
		SwitchCamSFX.play()
	match WhichAnimatronic:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
	GlobalVar.CanCameraMove = false
	$Control.visible = true
	

func _on_black_screen_setup_ready() -> void:
	DayStarted = true
	MaxDayTimer = MaxDayTimer * GlobalVar.DayMultiplier

func updateCam(Which: int, Value: int):
	if RoomStates[Which] != Value:
		RoomStates[Which] = Value
		if GlobalVar.CurrentCam == Which and GlobalVar.IsCameraOn == GlobalVar.Cam:
						GlobalVar.CamUpdate = true
