extends Control

onready var scoreText = get_node("ScoreText")


# Called when the node enters the scene tree for the first time.
func _ready():
	scoreText.text = "0"

func set_score_text (score):
	scoreText.text = String(score)
