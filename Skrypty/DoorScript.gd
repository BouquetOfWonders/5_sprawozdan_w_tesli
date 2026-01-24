extends AnimatedSprite2D
@onready
var root = $"."
@onready
var Sound = $"../DoorButton/AudioStreamPlayer2D"
var ShouldPlay := true
var rng = RandomNumberGenerator.new()

func _input(event):
	if event.is_action_pressed("DoorKey"):
		GlobalVar.IsDoorClosed = true
	elif event.is_action_released("DoorKey"):
		GlobalVar.IsDoorClosed = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GlobalVar.IsCameraOn == 0:
		if GlobalVar.IsDoorClosed == false and root.frame != 0:
			root.play_backwards()
		elif GlobalVar.IsDoorClosed == true and root.frame != 11:
			root.play()
			if not root.frame >= 9:
				ShouldPlay = true
		if root.frame >= 9 and ShouldPlay:
			Sound.pitch_scale = rng.randf_range(0.95, 1)
			Sound.play(0.18)
			ShouldPlay = false
	if GlobalVar.IsCameraOn == 1:
		root.visible = false
	else:
		root.visible = true
