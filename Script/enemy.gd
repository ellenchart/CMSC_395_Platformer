extends CharacterBody2D

@export var direction = -1
@export var speed = 50

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.size.x * 0.5 * direction
	
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.size.x * 0.5 * direction

	velocity.y += 20
	velocity.x = speed * direction
	
	move_and_slide()

func _on_top_checker_body_entered(body):
	if body.name == "Pearl":

		$AnimatedSprite2D.play("death")
		speed = 0 #stop movement 
		velocity = Vector2.ZERO  #freeze
		
		# Disable collision so the player can pass through
		set_collision_layer_value(4, false)
		set_collision_layer_value(0, false)
		$top_checker.set_deferred("monitoring", false)
		$sides_checker.set_deferred("monitoring", false)
		
		# Wait for the animation to finish, then delete the enemy
		await $AnimatedSprite2D.animation_finished
		queue_free()  # Delete enemy

func _on_sides_checker_body_entered(body):
	get_tree().change_scene_to_file("res://level_1.tscn")
