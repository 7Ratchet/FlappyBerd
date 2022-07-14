extends Position2D


const Pipes = preload("res://Scene/Pipes.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.seed = hash("Bafit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var RandomYPostition = rng.randf_range(-60,60)
	var MovingPipe = Pipes.instance()
	get_parent().add_child(MovingPipe)
	#print(RandomYPostition)
	MovingPipe.position = Vector2(self.global_position.x, self.global_position.y + RandomYPostition)
