extends Area2D

class_name EntityBase

@export var borderOffset = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	borderChek()



func borderChek():
	if(self.position.x < - borderOffset):
		self.position.x = 1280+borderOffset
		
	elif(self.position.x > 1280 + borderOffset):
		self.position.x = -borderOffset
		
		
	if(self.position.y <  - borderOffset):
		self.position.y = 720 + borderOffset
		
	elif(self.position.y > 720 + borderOffset):
		self.position.y = 0 - borderOffset

