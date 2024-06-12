extends Node2D

var ShipPlayer:Node
var ship = preload("res://ship.tscn")
var playButton
var QuitButton

var play = false
var point = 0
var PointLabel 
# Called when the node enters the scene tree for the first time.
func _ready():
	PointLabel = find_child("Points")
	playButton = find_child("PlayButton")
	QuitButton = find_child("ExitButton")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _physics_process(delta):
	if play:
		if(Input.is_key_pressed(KEY_UP)):
			ShipPlayer.MoveForward()
		if(Input.is_key_pressed(KEY_LEFT)):
			ShipPlayer.RotateL()
		if(Input.is_key_pressed(KEY_RIGHT)):
			ShipPlayer.RotateR()
		if(Input.is_key_pressed(KEY_SPACE)):
			ShipPlayer.Shoot()
	
func start_Game():
	if !play:
		for i in get_children():
			if i.has_meta("tag") and i.get_meta("tag") == "asteroid":
				i.queue_free()
		var newship = ship.instantiate()
		add_child(newship)
		newship.position = Vector2(1280/2,720/2)
		ShipPlayer = newship
		addPoint(-point)
		playButton.hide()
		QuitButton.hide()
		PointLabel.position = Vector2.ZERO
		play = true



func addPoint(AddP):
	point += AddP
	PointLabel.text = String.num(point)

func EndGame():
	play = false
	playButton.show()
	QuitButton.show()
	PointLabel.position = Vector2(540,250) 
	
func QuitGame():
	get_tree().quit()
