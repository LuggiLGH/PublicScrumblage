## Custom death animation for balls, defined through code. Must have a HealthManager as its parent for it to work.

extends Node
class_name CustomDeathAnimation

var ball:BallBodyBase

## Is the ball actively dying?
var dying = false

## Not recommended to change anything here.
func _on_death() -> void:
	dying = true
	Global.quake_trigger.emit(1)
	ball.pre_defeated.emit()
	ball.stat_controller.add_modifier("BehaviourScript.behaviour_active", 2, false, "DYING")
	custom_death_play()

## Change this with the custom death behavior.
func custom_death_play() -> void:
	Global.quake_trigger.emit(1)
	EventManager.special_move(ball,null,"res://Sounds/death_boom.mp3")
	await HitstopManager.resume
	ball.queue_free()
