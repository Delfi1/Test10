extends Camera2D

func _process(delta):
	zoom.x = clamp(zoom.x, 0.3, 2.5)
	zoom.y = clamp(zoom.y, 0.3, 2.5)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_EQUAL:
			zoom.x -= 0.1
			zoom.y -= 0.1
		if event.scancode == KEY_MINUS:
			zoom.x += 0.1
			zoom.y += 0.1
		if event.scancode == KEY_P:
			pause()
			
func pause():
	get_tree().paused = not get_tree().paused
	
