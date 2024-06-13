extends EntityBase



var ran = RandomNumberGenerator.new()
var BulletAsset = preload("res://bullet.tscn")
var speed = 300
var dir = Vector2.ZERO
var Collision = CollisionPolygon2D.new()
var size =10
func _ready():
	ran.randi_range(0,3)
	dir = Vector2.UP.rotated(ran.randi_range(0,3) * PI/2)
	
	var Pointlist = [Vector2(30,0),Vector2(30,-10),Vector2(10,-22),Vector2(-10,-22),Vector2(-30,-10),Vector2(-30,0),Vector2(22,10),Vector2(-22,10),Vector2(-30,0)]
	for i in Pointlist:
		i *= size
	borderOffset = 100
	
	Collision.polygon = PackedVector2Array(Pointlist)
	add_child(Collision)
	setStartPosition()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	test_Collisions()

func test_Collisions():
	if has_overlapping_areas():
		for c in get_overlapping_areas():
			if c.has_meta("tag") and c.get_meta("tag") == "bullet":
				die()

func die():
	find_parent("World").addPoint(10*size)
	self.queue_free()




func _draw():
	var line = Collision.polygon
	line.append(line[0])
	draw_polyline(line,Color.WHITE)
	


func _physics_process(delta):
	#self.position += dir * speed * delta
	pass

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
		
		

