extends Node2D

var fighters_pos = 0

signal players_pos_changed(pos)

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_Input_player1_pressed():
	fighters_pos+=1
	
	emit_signal("players_pos_changed", fighters_pos)
	print("player 1 pressed")

func _on_Input_player2_pressed():
	fighters_pos-=1
	
	emit_signal("players_pos_changed", fighters_pos)
	print("player 2 pressed")
