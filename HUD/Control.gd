extends Control

func _process(delta):
	get_node("FPS").set_text("FPS: " + String(Engine.get_frames_per_second()))
