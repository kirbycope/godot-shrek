extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not animation_player.is_playing():
		animation_player.play("Breathing_idle")
