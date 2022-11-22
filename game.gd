extends Node2D

var players_pos = 0

signal players_pos_changed(pos)

signal player_won(player_name)

var state = "running"

func _ready():
	pass

func _process(delta):
	if(state == "running"):
		if(players_pos>=10):
			emit_signal("player_won", "player 1")
			state = "finished"
		if(players_pos<=-10):
			emit_signal("player_won", "player 2")
			state = "finished"

func _on_Input_player1_pressed():
	players_pos+=1
	print(players_pos)
	emit_signal("players_pos_changed", players_pos)

func _on_Input_player2_pressed():
	players_pos-=1
	print(players_pos)
	emit_signal("players_pos_changed", players_pos)
