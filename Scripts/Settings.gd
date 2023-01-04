extends ColorRect

onready var Menu = get_parent().get_node("Menu")

onready var Graphics = get_node("Graphics")

onready var GButton = get_node("Sidebar/Graphics")

onready var Info = get_node("Info")

onready var IButton = get_node("Sidebar/Info")

onready var Version = get_node("Info/Version")

onready var Server_Ver = get_node("Info/Server_Version")

onready var Check = get_node("Info/Check")

onready var UButton = get_node("Info/Update")

onready var ver = "0.0.6"

onready var Sver = null

onready var _request = get_node("HTTPRequest")

onready var _download = get_node("HTTPRequest")

func _ready():
	_on_Graphics_pressed()
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
	Other.pressed = true
	
func back():
	self.visible = false
	Menu.visible = true

func _on_Check_pressed():
	_request.connect("request_completed", self, "_on_request_completed")
	UButton.disabled = true
	Check.disabled = true
	print("Doing request...")
	_request.request("https://raw.githubusercontent.com/Delfi1/Test10/master/State/Version.txt")

func _on_request_completed(result, response_code, headers, body):
	Sver = body.get_string_from_utf8()
	print(Sver)
	Server_Ver.text = "Server version: " + Sver
	Check.disabled = false
	if ver != Sver:
		UButton.disabled = false

func _on_Update_pressed():
	_download.connect("request_completed", self, "_on_download_completed")
	Check.disabled = true
	UButton.disabled = true
	_download.set_download_file("Test10.pck")
	_download.request("https://github.com/Delfi1/Test10/blob/master/Export/Test10.pck?raw=true")

func _on_download_completed(result, response_code, headers, body):
	print("Download complete!")
	Check.disabled = false
	get_tree().reload_current_scene()
