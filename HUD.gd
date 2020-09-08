extends CanvasLayer

signal start_game

var high_score = 0
var score = 0

func show_message(text) : 
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func _ready():
	pass # Replace with function body.

func show_game_over() : 
	score = int($ScoreLabel.text)
	if high_score < score : 
		high_score = score
	show_message("High Score = " + str(high_score) + "\n\nGame Over\nYour score was : " + str(score))
	yield($MessageTimer, "timeout")
	$ScoreLabel.text = str(0)
	$Message.text = "Dodge the\nCreeps!" 
	$Message.show()
	
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

func update_score(score) : 
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$Message.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

