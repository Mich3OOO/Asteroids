extends Node2D

@export var asteroidCooldown = 1.2


var AteroidAsset = preload("res://asteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	#createAsteroide()
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func createAsteroide():
	var newAsteroid = AteroidAsset.instantiate()
	get_tree().get_root().get_node("World").add_child.call_deferred(newAsteroid)
	get_tree().create_timer(asteroidCooldown).timeout.connect(func(): createAsteroide())
