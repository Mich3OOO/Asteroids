extends Node2D

@export var Cooldown = 1.2


@export var enemyAsset = preload("res://asteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_timer(Cooldown).timeout.connect(func(): createAsteroide())
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func createAsteroide():
	var NewEnemy = enemyAsset.instantiate()
	get_tree().get_root().get_node("World").add_child.call_deferred(NewEnemy)
	get_tree().create_timer(Cooldown).timeout.connect(func(): createAsteroide())
