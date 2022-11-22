extends Node2D

var players_origin 

var players

func _ready():
	players = get_node("players")
	players_origin = players.position

func _on_Game_players_pos_changed(pos):
	players.position.x = players_origin.x + (pos * 40)


func _on_Game_player_won(player_name):
	print(player_name + " won!")
	pass # Replace with function body.
