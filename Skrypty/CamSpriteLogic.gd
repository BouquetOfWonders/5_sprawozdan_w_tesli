extends Sprite2D

static var room11 = "res://assets/Rooms/Room11/"
static var room10 = "res://assets/Rooms/Room10/"
static  var room9 = "res://assets/Rooms/Room9/"
static var room8 = "res://assets/Rooms/Room8/"
static var room7 = "res://assets/Rooms/Room7/"
static var room6 = "res://assets/Rooms/Room6/"
static var room5 = "res://assets/Rooms/Room5/"
static var room4 = "res://assets/Rooms/Room4/"
static var room3 = "res://assets/Rooms/Room3/"
static var room2 = "res://assets/Rooms/Room2/"
static var room1 = "res://assets/Rooms/Room1/"
static var room0 = "res://assets/Rooms/MonitoringRoom/"
@onready
var root = $"."
var previousroom := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == GlobalVar.Cam and GlobalVar.CurrentCam == 2 and not GlobalVar.IsModemOn:
		root.visible = false
	else:
		root.visible = true
	if GlobalVar.CamUpdate == true:
		if GlobalVar.ForceNoCamTransision:
			GlobalVar.ForceNoCamTransision = false
		else:
			GlobalVar.CamTransision = true
		GlobalVar.CamUpdate = false
		var DisplayedCam := GlobalVar.CurrentCam
		if GlobalVar.IsCameraOn == 0:
			DisplayedCam = 0
		match DisplayedCam:
# This is the code responcible for holding room data
			0:
				var image = str(room0,GlobalVar.Room0State,".png/")
				root.texture = load(image)
			1:
				var image = str(room1,GlobalVar.Room1State,".png/")
				root.texture = load(image)
			2:
				var image = str(room2,GlobalVar.Room2State,".png/")
				root.texture = load(image)
			3:
				var image = str(room3,GlobalVar.Room3State,".png/")
				root.texture = load(image)
			4:
				var image = str(room4,GlobalVar.Room4State,".png/")
				root.texture = load(image)
			5:
				var image = str(room5,GlobalVar.Room5State,".png/")
				root.texture = load(image)
			6:
				var image = str(room6,GlobalVar.Room6State,".png/")
				root.texture = load(image)
			7:
				var image = str(room7,GlobalVar.Room7State,".png/")
				root.texture = load(image)
			8:
				var image = str(room8,GlobalVar.Room8State,".png/")
				root.texture = load(image)
			9:
				var image = str(room9,GlobalVar.Room9State,".png/")
				root.texture = load(image)
			10:
				var image = str(room10,GlobalVar.Room10State,".png/")
				root.texture = load(image)
			11:
				var image = str(room11,GlobalVar.Room11State,".png/")
				root.texture = load(image)
				
