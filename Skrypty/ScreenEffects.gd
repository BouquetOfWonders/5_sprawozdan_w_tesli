extends Polygon2D
@onready
var Root = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == 0:
		Root.visible = true
	else:
		Root.visible = false
