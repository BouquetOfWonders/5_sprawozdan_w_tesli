extends MeshInstance2D
@onready
var NoiseTransision = $"."
var Globalvar = GlobalVar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvar.CamTransision == true:
		Globalvar.CamTransision = false
		var tween = create_tween();
		tween.tween_method(set_shader_value, 5.0, 0.0, 0.5); 

# tween value automatically gets passed into this function
func set_shader_value(value: float):
	# in my case i'm tweening a shader on a texture rect, but you can use anything with a material on it
	NoiseTransision.material.set_shader_parameter("noise_intensity", value);
	
func SetVisibleToFalse():
	NoiseTransision.visible = false
