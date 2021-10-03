extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var heal = load("res://png/greenball.png")
var fball = load("res://png/red_ball.png")
var cball = load("res://png/pngkey.com-crystal-ball-png-191190.png")
var target
var test

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	_setspell()
	pass # Replace with function body.
	
func _setspell():
	if true:
		$Ball.set_texture(heal)
		
func set_target(target_arg):
	target = target_arg
	test = sqrt(pow(target.x - position.x, 2))
	var hypot = sqrt(pow(target.x - position.x, 2) + pow(target.y - position.y, 2))
	var opposite = target.y - position.y
	var angle = asin(opposite/hypot)
	var spin = Vector2(1, 0).rotated(angle-PI)
	$Tail.get_process_material().set_direction(Vector3(spin.x, spin.y, 0))
	
	#print(target)
	#print(position)
	print(spin)
	
	
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
