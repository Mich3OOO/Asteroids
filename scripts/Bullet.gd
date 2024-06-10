extends EntityBase

var speed = 300
var dir = Vector2.ZERO
var lifeTime = 1.6
var size = 2
var Collision = CollisionShape2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	tag = "bullet"
	print("created")
	get_tree().create_timer(lifeTime).timeout.connect(func(): self.queue_free())
	Collision.shape = RectangleShape2D.new()
	Collision.shape.size = Vector2.ONE * size
	add_child(Collision)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	test_Collisions()

func _physics_process(delta):
	self.position += dir * speed * delta


func init(newdir,newpos):
	dir = newdir
	self.position = newpos


func _draw():
	draw_rect(Collision.shape.get_rect ( ),Color.WHITE)
	
func test_Collisions():
	if has_overlapping_areas():
		self.queue_free()
