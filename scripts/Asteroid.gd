extends EntityBase


var Pointlist = []
var ran = RandomNumberGenerator.new()
var size = 10

var speed = 300
var dir = Vector2.ZERO

func _ready():
	size = ran.randi_range(4,9)
	var rot = 0
	dir = Vector2.UP.rotated(ran.randf_range(0,PI*2))
	speed = speed/size

	

	while rot < 2 * PI:
		Pointlist.append(Vector2.UP.rotated(rot) * ran.randi_range(3,12))
		rot += (2 * PI)/10 + randf_range(-0.5,0.5)
	
	borderOffset = 100
	setStartPosition()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)





func _draw():
	for i in range(len(Pointlist)-1):
		draw_line(Pointlist[i] * size,Pointlist[i+1] * size,Color.WHITE,2)
	draw_line(Pointlist[-1] * size,Pointlist[0] * size,Color.WHITE,2)


func _physics_process(delta):
	self.position += dir * speed * delta

func setStartPosition():
	var num = ran.randi_range(0,3)
	var m = borderOffset+1
	if num == 0:
		position = Vector2(ran.randi_range(0,1280),-m)
	elif num == 1:
		position = Vector2(1280+m,ran.randi_range(0,720))
	elif num == 2:
		position = Vector2(ran.randi_range(0,1280),720+m)
	elif num == 3:
		position = Vector2(-m,ran.randi_range(0,720))
		
		
		
func maxSize():
	var r = Pointlist[0].length()
	
	for i in Pointlist:
		if r < i.length():
			r = i.length()
	return r
		
		
		
		
