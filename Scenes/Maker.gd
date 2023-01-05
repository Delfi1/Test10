extends Node2D

onready var camera = get_node("Camera2D")

onready var Stats = get_node("HUD/Control/Stat")

onready var Box = get_node("Box")

const speed = 1

var Info = "FPS: " + String(Engine.get_frames_per_second())

var Mouse_pos = get_global_mouse_position()

var path = Vector2(stepify(Mouse_pos.x, 32), stepify(Mouse_pos.y, 32))

var mid_x = 0
var mid_y = 0

var target = null

var Menu = "res://Scenes/Menu.tscn"

func _process(delta):
	Info = "FPS: " + String(Engine.get_frames_per_second()) + "\n"

	Mouse_pos = get_global_mouse_position()
	
	# Изменение позиции объекта
	path = Vector2(stepify(Mouse_pos.x, 1), stepify(Mouse_pos.y, 1))
	
	Box.position = path
	
	Info += "x: " + String(Box.position.x) + "; y: " + String(Box.position.y)
	
	# Вывод текста на экран.
	Stats.text = Info
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene(Menu)
