extends Node2D

onready var Box = load("res://Objects/Box.tscn")

var path = "user://data.json"

var arr_obj = []

var default_data = {
	"information" : {
			"Objects" : "None",
			"count" : 0,
		},
		"saved" : [ ]
}

var data = { }

func _process(delta):
	data = {
		"information" : {
			"Objects" : "Box",
			"count" : len(arr_obj),
		},
		"saved" : arr_obj
	}


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_R:
			summon(Box.instance())
		if event.scancode == KEY_ESCAPE:
			exit()
		if event.scancode == KEY_S:
			save()

func summon(Obj : Node):
	Obj.position = get_global_mouse_position()
	arr_obj.append(Obj)
	add_child(Obj)

func exit():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	save()

func load_edior():
	var file = File.new()
	
	if not file.file_exist(path):
		reset_data()
		return
	
	file.open(path, File.READ)
	
	var text = file.get_as_text()

	data = parse_json(text)
	
	
	file.close()

func save():
	var file = File.new()
	
	file.open(path, File.WRITE)
	
	file.store_line(to_json(data))
	
	file.close()

func reset_data():
	data = default_data.duplicate(true)
