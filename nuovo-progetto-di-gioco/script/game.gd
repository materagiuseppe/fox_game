extends Node

@export var enemy_scenes: Array[PackedScene]
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_nemico_timeout() -> void:
	var enemy_scene =enemy_scenes.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = Vector2(152,167)
	if enemy_instance.name =="aquila":
		enemy_instance.position.y-=40
	add_child(enemy_instance)
	


func _on_player_hit() -> void:
	$Timer_punteggio.stop()
	$CanvasLayer/FinalMEssage.show()
	$CanvasLayer/SCORE.hide()
	$CanvasLayer/FinalScore.text=str(score)
	$CanvasLayer/FinalScore.show()
	$AudioStreamPlayer.pitch_scale=0.4
	Engine.time_scale=0.1
	await get_tree().create_timer(3*Engine.time_scale).timeout
	Engine.time_scale=1
	get_tree().reload_current_scene()
	


func _on_timer_punteggio_timeout() -> void:
	score+=1
	$CanvasLayer/SCORE.text= str(score)
	pass # Replace with function body.


func _on_timer_speed_timeout() -> void:
	Engine.time_scale+=0.01
	pass # Replace with function body.
