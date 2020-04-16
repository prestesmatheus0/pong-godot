extends Node
onready var hud = get_node("HUD")

var score_player_one = 0 
var score_player_two = 0
var max_score = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()
	$StartTimer.start()


func _on_Field_goal_left():
	score_player_two += 1
	$Score.play()
	update_score()
	
	if score_player_two < max_score:
		start_new_round()
g

func _on_Field_goal_right():
	score_player_one += 1
	$Score.play()
	update_score()
	
	
	if score_player_one < max_score: 
		start_new_round()
		
func start_new_round():
	$Ball.reset()
	$Racket.set_position(Vector2(50,256))
	$Racket2.set_position(Vector2(974,256))
	$StartTimer.start()
		


func _on_StartTimer_timeout():
	$Ball.set_start_direction()

func update_score():
	hud.get_node("HBoxContainer/ScorePlayerOne").set_text(str(score_player_one))
	hud.get_node("HBoxContainer/ScorePlayerTwo").set_text(str(score_player_two))
