extends ColorRect

onready var FS = get_node("FullScreen")

func _process(delta):
	OS.window_fullscreen = FS.pressed
