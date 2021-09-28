extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 1
	pass # Replace with function body.

func set_spell_color(r,g,b):
	var partmat = $Particles2D.get_process_material()
	partmat.color = Color(r,g,b,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
