extends Node2D

onready var camera = get_node("Camera2D")

onready var Stats = get_node("HUD/Control/Stat")

onready var Box = load("res://Objects/Box.tscn")

var Info = "FPS: " + String(Engine.get_frames_per_second())

var Mouse_pos = get_global_mouse_position()

var path = Vector2(stepify(Mouse_pos.x, 32), stepify(Mouse_pos.y, 32))

var mid_x = 0
var mid_y = 0

var target

enum Maker{IDLE, CREATE, LINK}

var state = Maker.IDLE

var Menu = "res://Scenes/Menu.tscn"

var obj

func _process(delta):
	Info = "FPS: " + String(Engine.get_frames_per_second()) + "\n"

	Mouse_pos = get_global_mouse_position()
	
	path = Vector2(stepify(Mouse_pos.x, 32), stepify(Mouse_pos.y, 32))
	
	Info += "x: " + String(Mouse_pos.x) + "; y: " + String(Mouse_pos.y) + "\n"

	match state:
		Maker.IDLE:
			pass
		Maker.CREATE:
			obj = Box.instance()
			obj.mode = 1
			obj.position = path
			self.add_child(obj)
			state = Maker.LINK
		Maker.LINK:
			obj.position = path
			Info += "Obj.x: " + String(path.x) + "; Obj.y: " + String(path.y)

	# Вывод текста на экран.
	Stats.text = Info
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene(Menu)
	if Input.is_action_just_pressed("MouseLeft"):
		if state == Maker.LINK:
			state = Maker.IDLE
			obj.position = Vector2(stepify(Mouse_pos.x, 32), stepify(Mouse_pos.y, 32))
		else:
			state = Maker.CREATE
