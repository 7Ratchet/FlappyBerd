extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2()

var gravity = 600

var jump = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("Jump"):
		jump = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vel.y += gravity * delta
	if jump == true:
		vel.y = -200
		jump = false
		
	vel = move_and_slide(vel, Vector2.UP)



func _on_HitBox_body_entered(body):
	if body.is_in_group("Pipe"):
		get_tree().reload_current_scene()
