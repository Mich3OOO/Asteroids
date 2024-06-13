extends AudioStreamPlayer2D

class_name  SoundManager
var ShipExplosion = preload("res://sound/435413__v-ktor__explosion12.wav")
var AsteroidExplosion = preload("res://sound/435415__v-ktor__explosion10.wav")
var UFOExplosion = preload("res://sound/482992__v-ktor__large-explosion-2.wav")
var shootSound = preload("res://sound/435417__v-ktor__shoot02.wav")
var soundManager
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func PlayShoot():
	self.stream = shootSound
	self.play()
	
func PlayAsteroidExplosion():
	self.stream = AsteroidExplosion
	self.play()

func PlayShipExplosion():
	self.stream = ShipExplosion
	self.play()
	
func PlayUFOExplosion():
	self.stream = UFOExplosion
	self.play()
