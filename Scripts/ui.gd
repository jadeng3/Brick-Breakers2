extends CanvasLayer

class_name UI

@onready var lifes_label = %LifesLabel
@onready var game_lost_container= $GameLostContainer
@onready var level_won_container = $LevelWonContainer

@onready var background_music = $"../BackgroundMusic"
@onready var level_passed_audio = $"../MusicPack/LevelPassedAudio"
@onready var wall_audio = $"../MusicPack/WallAudio"
@onready var death_sound = $"../MusicPack/DeathSound"


func set_lifes(lifes:int):
	lifes_label.text = "Lifes: %d" % lifes

func game_over():
	game_lost_container.show()
	background_music.stop()
	death_sound.play()
	wall_audio.play()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()

func on_level_won():
	level_won_container.show()
	
func _on_level_won_button_pressed():
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()
