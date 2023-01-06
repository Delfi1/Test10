extends RigidBody2D

onready var IDLE = $IDLE
onready var Choosen = $Choosen
onready var State = $State

var Mouse_pos

var Selected = false
var Info

func _process(delta):
	
	if not Selected:
		self.set_collision_layer_bit(0, 1)
		self.set_collision_mask_bit(0, 1)
		self.mode = 0
		return
	
	self.rotation_degrees = 0
	
	Info = "Selected" + "\n"
	Info += "x: " + String(self.position.x) + " y: " + String(self.position.y) + "\n"
	
	
	self.set_collision_layer_bit(0, 0)
	self.set_collision_mask_bit(0, 0)
	self.mode = 1
	Mouse_pos = get_global_mouse_position()
	self.position = Vector2(stepify(Mouse_pos.x, 32), stepify(Mouse_pos.y, 32))
	
	State.text = Info

func _on_SelectionArea2D_selection_toggled(selection):
	Selected = selection
	Choosen.visible = selection
	State.visible = selection
	self.mode = 1
