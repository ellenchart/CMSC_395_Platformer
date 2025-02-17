extends Area2D

@onready var animated_sprite = $AnimatedSprite2D  # Reference to the AnimatedSprite2D

func _ready():
	animated_sprite.play("spin")  # Play animation on start
	
func _on_body_entered(body):
	$AnimationPlayer.play("bounce")
	
func _on_animation_player_animation_finished(anim_name):
	queue_free()
