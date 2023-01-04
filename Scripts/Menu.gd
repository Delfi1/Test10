extends ColorRect

onready var Settings = get_parent().get_node("Settings")

func _on_Settings_pressed():
	# Изменение видимости.
	self.visible = false
	Settings.visible = true

func _on_Exit_pressed():
	# Выход из игры с кодом 0
	get_tree().quit()
