extends KinematicBody2D
# player.gd

const ACCEL = 15000
const MAX_SPEED = 8000
const FRICTION = -300
var vel = Vector2.ZERO
var acc = Vector2.ZERO
var laser_color = Color(1.0, .329, .298)

var casting = false
var cast_finished = false



export var gender = ""
export var path_to_cape = ""
export var path_to_frame = ""
export var path_to_head = ""
export var path_to_torso = ""
export var path_to_legs = ""
export var path_to_feet = ""
export var path_to_large_weapon = ""

var direction
var current_animation

var layerassets = []
var weaponassets = []

func _ready():
	z_index = 1
	direction = 1
	current_animation = "idle"
	var layerasset = load("res://layerasset.tscn")
	var large_weapon = load("res://largeweapon.tscn")
	var frame = layerasset.instance()
	add_child(frame)
	var head = layerasset.instance()
	add_child(head)
	var torso = layerasset.instance()
	add_child(torso)
	var feet = layerasset.instance()
	add_child(feet)
	var legs = layerasset.instance()
	add_child(legs)
	var cape = layerasset.instance()
	add_child(cape)
	
	var large = large_weapon.instance()
	add_child(large)
	
	
	
	frame.set_sprite_texture(load(path_to_frame))
	head.set_sprite_texture(load(path_to_head))
	torso.set_sprite_texture(load(path_to_torso))
	feet.set_sprite_texture(load(path_to_feet))
	legs.set_sprite_texture(load(path_to_legs))
	cape.set_sprite_texture(load(path_to_cape))
	large.set_sprite_texture(load(path_to_large_weapon))
	
	
	
	layerassets.append(frame)
	layerassets.append(head)
	layerassets.append(torso)
	layerassets.append(feet)
	layerassets.append(legs)
	layerassets.append(cape)
	weaponassets.append(large)
	
	set_physics_process(true)

func slash():
	for e in layerassets:
		e.play_animation("slash",direction)
	for e in weaponassets:
		e.play_animation("slash",direction)

func castdone():
	cast_spell()
	cast_finished = true
	for e in layerassets:
		e.play_animation("spellcast",direction)
		
func cast_spell():
	$Polygon2D.position = get_local_mouse_position()
	casting = false

	


func _physics_process(delta):
	acc.x = 0
	acc.y = 0
	
	
	if Input.is_action_pressed("right"):
		casting = false
		direction = 0
		acc.x = 1
	if Input.is_action_pressed("left"):
		casting = false
		
		direction = 2
		acc.x = -1
	if Input.is_action_pressed("up"):
		casting = false
		direction = 3
		acc.y = -1
	if Input.is_action_pressed("down"):
		casting = false
		direction = 1
		acc.y = 1
	if Input.is_action_pressed("spellcast"):
		if not casting:
			casting = true
			for e in layerassets:
				e.play_animation("spellcast",direction)
		return
	if Input.is_action_pressed("slash"):
		if not casting:
			slash()
		
		return
	acc = acc.normalized()
	acc.x *= ACCEL
	acc.y *= ACCEL
	if acc.x == 0 and acc.y == 0:
		for e in layerassets:
			e.play_animation("idle",direction)
	else:
		for e in layerassets:
			e.play_animation("walk",direction)
	if acc.x == 0:
		acc.x = vel.x * FRICTION * delta
	if acc.y == 0:
		acc.y = vel.y * FRICTION * delta
	
	$RayCast2D.rotate(vel.angle())
	vel += acc * delta
	
	vel.x = clamp(vel.x, -MAX_SPEED,MAX_SPEED)
	vel.y = clamp(vel.y, -MAX_SPEED,MAX_SPEED)
		
	var result = move_and_slide(vel*delta)
	
	

