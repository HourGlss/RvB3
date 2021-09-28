extends Node2D

func _ready():

	var spell_test_class = load("res://circlespell.tscn")
	var spell_test = spell_test_class.instance()
	add_child(spell_test)
	spell_test.set_spell_color(1,0,0)
	


	
