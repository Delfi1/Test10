extends Node2D

onready var camera = get_node("Camera2D")

onready var Stats = get_node("HUD/Control/Stat")

var Info = "FPS: " + String(Engine.get_frames_per_second())

func _process(delta):
	Info = "FPS: " + String(Engine.get_frames_per_second()) + "\n"
	Info += "x: " + String(camera.position.x) + "; y: " + String(camera.position.y)
	Stats.text = Info

func _input(event):
	
