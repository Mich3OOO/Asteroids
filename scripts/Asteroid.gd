extends EntityBase


var Pointlist = []
var ran = RandomNumberGenerator.new()
var size = 10
var AteroidAsset = preload("res://asteroid.tscn")
var speed = 300
var dir = Vector2.ZERO
var small = false
var Collision = CollisionPolygon2D.new()
func _ready():
	size = ran.randi_range(4,9)
	if small: size = ran.randi_range(3,6)
	var rot = 0
	dir = Vector2.UP.rotated(ran.randf_range(0,PI*2))
	speed = speed/size

	

	while rot < 2 * PI:
		Pointlist.append(Vector2.UP.rotated(rot) * ran.randi_range(3,12) *size)
		rot += (2 * PI)/10 + randf_range(-0.5,0.5)
	
	borderOffset = 100
	if !small: setStartPosition()
	
	Collision.polygon = PackedVector2Array(Pointlist)
	add_child(Collision)
	if size<=6 : small = true


func forceSmall(NewPos):
	small = true
	position = NewPos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tag = "asteroid"
	super(delta)
	test_Collisions()

func test_Collisions():
	if has_overlapping_areas():
		for c in get_overlapping_areas():
			if c.tag == "bullet":
				die()
		
func die():
	if !small:
		for i in range(2):
			var newAsteroid = AteroidAsset.instantiate()
			newAsteroid.forceSmall(position)
			get_tree().get_root().get_node("World").add_child.call_deferred(newAsteroid)
	self.queue_free()




func _draw():
	var line = Collision.polygon
	line.append(line[0])
	draw_polyline(line,Color.WHITE)
	


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
		
		

