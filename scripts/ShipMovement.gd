extends EntityBase

class_name ShipMovement
@export var RSpeed = 0.1
@export var friction = 0.98
@export var speed = 130
@export var Aceleration = 35
@export var ShootCooldowm = 0.4


var canShoot = true
var bulletRes = preload("res://bullet.tscn")
var dir = Vector2.ZERO
var linear = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640,360) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	print((linear + dir * Aceleration).length())
	
	


func MoveForward():
	dir = (Vector2.UP.rotated(rotation) + dir).normalized()
	if((linear + dir * Aceleration ).length()<speed):linear += dir * Aceleration 
	


func RotateL():
	Rotate(-1)

func RotateR():
	Rotate(1)

func Rotate(Rdir:int):
	rotate(Rdir*RSpeed)

func Shoot():
	if canShoot:
		var bullterdir = Vector2.UP.rotated(rotation)
		var newbullet = bulletRes.instantiate()
		newbullet.init(bullterdir,position + bullterdir * 45)
		newbullet.set_name("b")
		get_tree().get_root().get_node("World").add_child(newbullet)
		canShoot = false
		get_tree().create_timer(ShootCooldowm).timeout.connect(func(): canShoot = true)
		

func _physics_process(delta):
	
	self.position += linear * delta
	if((linear * friction).length() >0):
		linear *= friction
	else:
		linear = Vector2.ZERO
		
