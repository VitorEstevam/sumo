extends Node2D

var players_origin 
var players
var state

func _on_game_scene_state_changed(_state):
	state = _state

func _ready():
	players = get_node("players")
	players_origin = players.position
	
func _process(_delta):
	if(state == StateEnum.States.running):
		self.get_node("gameend").visible = false
	elif(state == StateEnum.States.finished):
		self.get_node("gameend").visible = true

func _on_Game_players_pos_changed(pos):
	players.position.x = players_origin.x + (pos * 40)

func _on_Game_player_won(player_name):
	print(player_name + " won!")
	self.get_node("gameend/Label").text = player_name + " venceu!"
	pass # Replace with function body.

