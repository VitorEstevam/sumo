extends Node2D

signal players_pos_changed(pos)
signal player_won(player_name)
signal state_changed(state)

var state = StateEnum.States.running

func change_state(new_state):
	emit_signal("state_changed", new_state)
	state = new_state
	
var players_pos = 0
	
func _init():
	randomize()

func _ready():
	change_state(StateEnum.States.running)

func _process(_delta):
	if(state == StateEnum.States.running):
		if(players_pos>=10):
			emit_signal("player_won", "player 1")
			change_state(StateEnum.States.finished)
		if(players_pos<=-10):
			emit_signal("player_won", "player 2")
			change_state(StateEnum.States.finished)
			
func _set_player_pos(pos):
	if(state == StateEnum.States.running):
		players_pos+=pos

func _on_input_player1_pressed():
	if(randi() % 10 != 0 ):
		_set_player_pos(1)
		emit_signal("players_pos_changed", players_pos)

func _on_input_player2_pressed():
	if(randi() % 10 != 0 ):
		_set_player_pos(-1)
		emit_signal("players_pos_changed", players_pos)

func _on_input_enter_pressed():
	var error_code = get_tree().reload_current_scene()
	if error_code != 0:
		print("ERROR: ", error_code)
