extends EntityBase

var speed = 300
var dir = Vector2.ZERO
var lifeTime = 1.5


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_timer(lifeTime).timeout.connect(func(): self.queue_free())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)

func _physics_process(delta):
	self.position += dir * speed * delta


func init(newdir,newpos):
	dir = newdir
	self.position = newpos
