extends Node2D


#var vel = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	#vel.x = -2
	self.global_position -= Vector2(4,0)
 


func _on_PipeDestroyer_timeout():
	queue_free()
