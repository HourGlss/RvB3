extends Node2D
# layerasset.gd
var state_machine

onready var sprite = get_node("Sprite")	

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")

func set_sprite_texture(texture_to_use):
	sprite.texture = texture_to_use
	sprite.scale.x = 1
	sprite.scale.y = 1
	
func play_animation(animation, direction):
	var animation_to_play = str(animation)+str(direction)
	state_machine.travel(animation_to_play)

func spell_complete():
	var par = get_parent()
	if par != null:
		par.castdone()
	print("spell completed")
