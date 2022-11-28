extends Node2D

var music = preload("res://assets/sounds/The Good Fight (w intro).mp3")
var win = preload("res://assets/sounds/Jingle_Win_00.mp3")
var win2 = preload("res://assets/sounds/claps.ogg")

var punchs = {}
var can_punch = true
var lastpunch = 0

var state

func _init():
	randomize()
	
	for i in range(18):
		var name = "res://assets/sounds/punchs/"+String(i+1)+".ogg"		
		punchs[i] = load(name)


func _ready():
	$background.stream = music
	$background.play()

func _process(_delta):
	if(lastpunch == 0):
		can_punch=true
	else:
		can_punch=false
		lastpunch -= 1

func _on_punch(_pos):
	if can_punch and state == StateEnum.States.running:
		var index = randi() % 18 
		$effect.stream = punchs[index]
		$effect.play()
		lastpunch = 8


func _on_game_scene_state_changed(_state):
	state = _state
	
	if(_state == StateEnum.States.finished):
		$background.stop()
		$background.stream = win
		$background.play()
#
		$effect.stop()
		$effect.stream = win2
		$effect.play()

