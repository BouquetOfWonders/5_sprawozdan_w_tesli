extends MeshInstance2D
@onready
var NoiseTransision = $"."
@onready

var Globalvar = GlobalVar


func _process(_delta: float) -> void:
	if Globalvar.CamTransision == true:
		Globalvar.CamTransision = false
		var tween = create_tween();
		tween.set_ease(Tween.EASE_OUT)
		if Globalvar.IsCameraOn == 0:
			tween.tween_method(set_shader_value, 5.0, 0.025, 0.3); 
		else:
			tween.tween_method(set_shader_value, 5.0, 0.0, 0.3); 

func set_shader_value(value: float):
	NoiseTransision.material.set_shader_parameter("noise_intensity", value);
	
func SetVisibleToFalse():
	NoiseTransision.visible = false
