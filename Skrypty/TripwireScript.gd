extends ColorRect
@onready
var Root = $"."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.TripwireID == -9:
		Root.visible = false
	else:
		Root.visible = true
		match GlobalVar.TripwireID:
			1: 
				Root.position = Vector2(-115.0, 15.0)
			2:
				Root.position = Vector2(-115.0, 125.0)
			3:
				Root.position = Vector2(-115.0, 225.0)
			4:
				Root.position = Vector2(-115.0, 325.0)
			5:
				Root.position = Vector2(335.0, 15.0)
			6:
				Root.position = Vector2(335.0, 125.0)
			7:
				Root.position = Vector2(335.0, 225.0)
			8:
				Root.position = Vector2(335.0, 325.0)
