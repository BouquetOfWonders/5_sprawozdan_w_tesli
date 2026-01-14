extends Sprite2D
@onready
var room1 = "res://assets/Rooms/TestRooms/"
@onready
var room0 = "res://assets/Rooms/MonitoringRoom/"
@onready
var root = $"."
var previousroom := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.CamUpdate == true:
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
				
