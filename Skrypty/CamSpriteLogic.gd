extends Sprite2D
@onready
var room1 = "res://assets/Rooms/TestRooms/"
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
		match GlobalVar.CurrentCam:
			0:
				pass
			1:
				var image = str(room1,GlobalVar.Room1State,".png/")
				root.texture = load(image)
				
