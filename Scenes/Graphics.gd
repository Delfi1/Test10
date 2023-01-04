extends ColorRect

onready var FS = get_node("FullScreen")

func _process(delta):
	OS.window_fullscreen = FS.pressed

func _input(event):
	# Проверка нажатия клавиши на клавиатуре.
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_F11:
			FS.pressed = !FS.pressed
