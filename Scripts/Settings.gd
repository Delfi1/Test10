extends ColorRect

onready var Menu = get_parent().get_node("Menu")

onready var Graphics = get_node("Graphics")

onready var GButton = get_node("Sidebar/Graphics")

onready var Info = get_node("Info")

onready var IButton = get_node("Sidebar/Info")

onready var Version = get_node("Info/Version")

onready var Server_Ver = get_node("Info/Server_Version")

var Maker = "res://Scenes/Maker.tscn"

onready var ver = "0.0.7"

onready var Sver = null

func _ready():
	_on_Graphics_pressed()
	Version.text = "Version: " + ver

func _input(event):
	# Проверка нажатия клавиши на клавиатуре.
	if event is InputEventKey and event.pressed:
		# Выход в главное меню.
		if event.scancode == KEY_ESCAPE and self.visible:
			back()

func _on_Back_pressed():
	back()

func _on_Graphics_pressed():
	disable(GButton)
	Graphics.visible = GButton.pressed

func _on_Info_pressed():
	disable(IButton)
	Info.visible = IButton.pressed

func disable(Other : Button):
	GButton.pressed = false
	Graphics.visible = false
	IButton.pressed = false
	Info.visible = false
	Other.pressed = true
	
func back():
	self.visible = false
	Menu.visible = true

func _on_Create_pressed():
	get_tree().change_scene(Maker)
