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
var soundManager
# Called when the node enters the scene tree for the first time.
func _ready():
	soundManager = self.get_parent().get_node("AudioManager")
	position = Vector2(640,360) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	test_Collisions()
	
	
func test_Collisions():
	if has_overlapping_areas():
		die()
		
func die():
	soundManager.PlayShipExplosion()
	find_parent("World").EndGame()
	self.queue_free()

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
		newbullet.init(bullterdir,position + bullterdir * 60)
		newbullet.set_name("b")
		get_tree().get_root().get_node("World").add_child(newbullet)
		canShoot = false
		soundManager.PlayShoot()
		get_tree().create_timer(ShootCooldowm).timeout.connect(func(): canShoot = true)
		

func _physics_process(delta):
	
	self.position += linear * delta
	if((linear * friction).length() >0):
		linear *= friction
	else:
		linear = Vector2.ZERO
	

func _draw():
	var line = get_child(0).polygon
	line.append(line[0])
	draw_polyline(line,Color.WHITE)
