extends Label

onready var timer = get_node("Timer")
onready var Menu = get_parent().get_node("Menu")
onready var Settings = get_parent().get_node("Settings")

func _ready():
	# Включение игры: 1) Установка названия окна
	OS.set_window_title("Delfi:World")
	# 2) Изменение видимости окон:
	self.visible = true
	Menu.visible = false
	Settings.visible = false
	# 3) Включение таймера
	timer.start(1.5)
	
func _on_Timer_timeout():
	# 4) Остановка таймера
	timer.stop()
	# 5) Изменение видимости.
	self.visible = false
	Menu.visible = true
	
