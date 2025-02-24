extends Node3D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var shrek_animation_player: AnimationPlayer = $Shrek/AnimationPlayer
@onready var toilet_animation_player: AnimationPlayer = $Toilet/AnimationPlayer
@onready var timer = $Timer


func _ready():

	timer.wait_time = 3.8
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout1)
	timer.start()


func _on_timer_timeout1():
	
	audio_stream_player.play()

	timer.wait_time = 0.2
	timer.one_shot = true
	timer.timeout.disconnect(_on_timer_timeout1)
	timer.timeout.connect(_on_timer_timeout2)
	timer.start()

func _on_timer_timeout2():
	$Shrek.show()
	shrek_animation_player.play("Warrior_idle")
	var tween = create_tween()
	tween.parallel().tween_property($Shrek, "position:z", $Shrek.position.z - 0.6, 0.5)
	toilet_animation_player.play("open")
