extends TileMap
# tilemap.gd
var WATER = 312266
var BRICK = 3809838
var GROUND = 3735709
var WIDTH = 3072
var HEIGHT = 640
var tilesize = 64

func _ready():
	for x in range(int(WIDTH/tilesize)):
		for y in range(int(HEIGHT/tilesize)):
			if x == 0 or y == 0:
				set_cell(x,y,BRICK)
			elif x == int(WIDTH/tilesize) -1:
				set_cell(x,y,BRICK)
			elif y == int(HEIGHT/tilesize) -1:
				set_cell(x,y,BRICK)
			else:
				set_cell(x,y,GROUND)
				
