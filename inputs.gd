extends Node2D

signal player1_pressed
signal player2_pressed

func _input(event):
	if event.is_action_pressed("player1"):
		emit_signal("player1_pressed")
	if event.is_action_pressed("player2"):
		emit_signal("player2_pressed")
