extends Area2D

var posic = Vector2(100, 100)
var movimiento = Vector2()
var rebote = 1
const VELOCIDAD = 150


func _ready():
	OS.center_window()
	set_position(posic)
	pass 
	
func _process(delta):
	SF_direccion()
	posic += movimiento * VELOCIDAD * delta
	set_position(posic)
	pass

func SF_direccion():
	movimiento = Vector2()
	if Input.is_action_pressed("ui_left"):
		movimiento.x = -1
	if Input.is_action_pressed("ui_right"):
		movimiento.x = 1
	if Input.is_action_pressed("ui_up"):
		movimiento.y = -1
	if Input.is_action_pressed("ui_down"):
		movimiento.y = 1
	movimiento = movimiento.normalized()
	if movimiento == Vector2():
		rebote = 1
	movimiento *= rebote
	pass


func _on_Player_body_entered(body):
	rebote *= -1
	pass # Replace with function body.
