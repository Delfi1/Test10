extends ColorRect

onready var FS = get_node("FullScreen")
onready var VS = get_node("Vsync")

func _process(delta):
	OS.window_fullscreen = FS.pressed
	OS.vsync_enabled = VS.pressed

func _input(event):
	# Проверка нажатия клавиши на клавиатуре.
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_F11:
			FS.pressed = !FS.pressed
