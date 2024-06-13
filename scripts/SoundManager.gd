extends Node2D

class_name  SoundManager
var ShipExplosion = preload("res://sound/435413__v-ktor__explosion12.wav")
var AsteroidExplosion = preload("res://sound/435415__v-ktor__explosion10.wav")
var UFOExplosion = preload("res://sound/482992__v-ktor__large-explosion-2.wav")
var shootSound = preload("res://sound/435417__v-ktor__shoot02.wav")
var SoundList = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	garbageCollector()


func PlayShoot():
	self.play(shootSound)
	
func PlayAsteroidExplosion():
	self.play(AsteroidExplosion)

func PlayShipExplosion():
	self.play(ShipExplosion)
	
func PlayUFOExplosion():
	self.play(UFOExplosion)
	
	
func play(sound):
	SoundList.append(AudioStreamPlayer2D.new())
	get_parent().add_child(SoundList[-1])
	SoundList[-1].stream = sound
	SoundList[-1].play()

func garbageCollector():
	for i in range(len(SoundList)-1,-1,-1):
		if !SoundList[i].is_playing ():
			SoundList[i].queue_free()
			SoundList.pop_at(i)
			print("si")
