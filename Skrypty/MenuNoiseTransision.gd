extends MeshInstance2D
@onready
var NoiseTransision = $"."
@onready

var Globalvar = GlobalVar


func _process(_delta: float) -> void:
	if Globalvar.MenuCamTransision == true:
		Globalvar.MenuCamTransision = false
		var tween = create_tween();
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_method(set_shader_value, 5.0, 0.0, 0.3); 

func set_shader_value(value: float):
	NoiseTransision.material.set_shader_parameter("noise_intensity", value);
