extends Sprite2D
var Position := -320
@onready
var Root = $"."
var GoingLeft := true
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LoadImage(floor(rng.randf_range(1, 9)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GoingLeft:
		if Root.position.x < 960:
			Root.position.x += 50 * delta
		else:
			GlobalVar.MenuCamTransision = true
			GoingLeft = false
			LoadImage(floor(rng.randf_range(1, 9)))
	else:
		if Root.position.x > 320:
			Root.position.x -= 50 * delta
		else:
			GlobalVar.MenuCamTransision = true
			GoingLeft = true
			LoadImage(floor(rng.randf_range(1, 9)))

func LoadImage(WhichOne: int) -> void:
	match WhichOne:
		1:
			Root.texture = load("res://assets/Rooms/Room3/0.png")
		2:
			Root.texture = load("res://assets/Rooms/Room4/0.png")
		3:
			Root.texture = load("res://assets/Rooms/Room5/0.png")
		4:
			Root.texture = load("res://assets/Rooms/Room6/0.png")
		5:
			Root.texture = load("res://assets/Rooms/Room7/0.png")
		6:
			Root.texture = load("res://assets/Rooms/Room8/0.png")
		7:
			Root.texture = load("res://assets/Rooms/Room9/0.png")
		8:
			Root.texture = load("res://assets/Rooms/Room10/0.png")
		9:
			Root.texture = load("res://assets/Rooms/Room3/11.png")
