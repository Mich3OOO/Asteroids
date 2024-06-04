extends Node

@export var ShipPlayer:Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if(event.is_action("MoveF")):
		ShipPlayer.MoveForward()
		
		
	if(event.is_action("RotateL")):
		ShipPlayer.RotateL()
	if(event.is_action("RotateR")):
		ShipPlayer.RotateR()
	if(event.is_action("Shoot")):
		ShipPlayer.Shoot()
