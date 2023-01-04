extends ColorRect

onready var Menu = get_parent().get_node("Menu")

onready var Graphics = get_node("Graphics")

onready var GButton = get_node("Sidebar/Graphics")

onready var Info = get_node("Info")

onready var IButton = get_node("Sidebar/Info")

onready var Version = get_node("Info/Version")

onready var Server_Ver = get_node("Info/Server_Version")

onready var ver = "0.0.1"

onready var Sver = null

onready var _request = get_node("HTTPRequest")

func _ready():
	Version.text = "Version: " + ver
	_request.connect("request_completed", self, "_on_request_completed")

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
	if Other != null:
		Other.pressed = true
	
func back():
	self.visible = false
	Menu.visible = true
	disable(null)


func _on_Check_pressed():
	print("Doing request...")
	_request.request("http://www.mocky.io/v2/5185415ba171ea3a00704eed")

func _on_request_completed(result, response_code, headers, body):
	Sver = body.get_string_from_utf8()
	print(Sver.type())
