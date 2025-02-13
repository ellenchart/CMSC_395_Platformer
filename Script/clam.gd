extends Area2D

@export var end_screen_scene: PackedScene  # Drag your "EndScreen.tscn" into this in the editor

func _on_body_entered(body):
	if body.name == "Pearl":
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.stop()
		await get_tree().create_timer(0.4).timeout
		get_tree().change_scene_to_packed(end_screen_scene)  # Switch scene
