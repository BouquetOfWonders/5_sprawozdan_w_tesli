extends MeshInstance2D
signal SetupReady

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match SaveData.Contents.currentNight:
		0:
			$"../Label".text = "NIGHT_0"
		1:
			$"../Label".text = "NIGHT_1"
		2:
			$"../Label".text = "NIGHT_2"
		3:
			$"../Label".text = "NIGHT_3"
		4:
			$"../Label".text = "NIGHT_4"
		5:
			$"../Label".text = "NIGHT_5"
		6:
			$"../Label".text = "NIGHT_6"

	
	await get_tree().create_timer(5).timeout
	for I in 300:

		$".".self_modulate = Color(1, 1, 1, 1 - float(I)/300)
		$"../Label".self_modulate = Color(1, 1, 1, 1 - float(I)/300)
		await get_tree().process_frame
	$".".visible = false
	$"../Label".visible = false
	GlobalVar.CanCameraMove = true
	SetupReady.emit()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
