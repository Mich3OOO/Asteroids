extends Node2D

@export var ShipPlayer:Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _physics_process(delta):
	if(Input.is_key_pressed(KEY_UP)):
		ShipPlayer.MoveForward()
	if(Input.is_key_pressed(KEY_LEFT)):
		ShipPlayer.RotateL()
	if(Input.is_key_pressed(KEY_RIGHT)):
		ShipPlayer.RotateR()
	if(Input.is_key_pressed(KEY_SPACE)):
		ShipPlayer.Shoot()
	

