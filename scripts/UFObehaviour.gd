extends EntityBase



var ran = RandomNumberGenerator.new()
var BulletAsset = preload("res://bullet.tscn")
var speed = 100
var dir = Vector2.ZERO
var Collision = CollisionPolygon2D.new()
var size = 1.5

var shootCooldow = 2
var sigleShootCooldown = 0.2
var bulletRes = preload("res://bullet.tscn")
var shootedBullet = 0
var maxShootedBullet = 3
func _ready():
	get_tree().create_timer(shootCooldow).timeout.connect(func(): multipleshoot())
	dir = Vector2.UP.rotated(ran.randi_range(0,3) * PI/2)
	
	var Pointlist = [Vector2(30,0),Vector2(30,-10),Vector2(10,-22),Vector2(-10,-22),Vector2(-30,-10),Vector2(-30,0),Vector2(-22,10), Vector2(22,10),Vector2(30,0)]
	for i in range(0,len(Pointlist)):
		Pointlist[i] *= size
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
	find_parent("World").addPoint(150)
	self.queue_free()




func _draw():
	var line = Collision.polygon
	line.append(line[0])
	draw_polyline(line,Color.WHITE)
	draw_line(Vector2(30,0)*size,Vector2(-30,0)*size,Color.WHITE)
	


func _physics_process(delta):
	if shootedBullet == 0: self.position += dir * speed * delta
	pass

func setStartPosition():
	
	var m = borderOffset+1
	if dir.y == -1:
		position = Vector2(ran.randi_range(0,1280),-m)
	elif dir.x == -1:
		position = Vector2(1280+m,ran.randi_range(0,720))
	elif dir.y == 1:
		position = Vector2(ran.randi_range(0,1280),720+m)
	elif dir.x == 1:
		position = Vector2(-m,ran.randi_range(0,720))
		

func multipleshoot():
	oneShoot()
	

func oneShoot():
	var bullterdir
	var newbullet
	for i in range(0,4):
		
		bullterdir = Vector2.UP.rotated(i*PI/2)
		newbullet = bulletRes.instantiate()
		newbullet.init(bullterdir,position + bullterdir * 60)
		newbullet.set_meta("tag","UFO bullet")
		newbullet.speed = 200
		get_tree().get_root().get_node("World").add_child(newbullet)
	
	if shootedBullet <= maxShootedBullet:
		shootedBullet +=1
		get_tree().create_timer(sigleShootCooldown).timeout.connect(func(): oneShoot())
	else:
		shootedBullet = 0
		get_tree().create_timer(shootCooldow).timeout.connect(func(): multipleshoot())

