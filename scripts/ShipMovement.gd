extends RigidBody2D

class_name ShipMovement
@export var RSpeed =5000
@export var MaxRSpeed =1
@export var MaxSpeed = 40
@export var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func MoveForward():
	
	apply_central_force(Vector2(0, -100).rotated(rotation))
	print(Vector2(0, -100).rotated(rotation))



func RotateL():
	Rotate(-1)
	
func RotateR():
	Rotate(1)
	
func Rotate(dir:int):
		
	apply_torque(dir*RSpeed)
	
func Shoot():
	print("Shoot")
