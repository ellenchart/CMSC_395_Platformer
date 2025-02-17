extends CharacterBody2D

@export var speed: float = 180
@export var gravity: float = 980  # Use a realistic gravity value
@export var jump_force: float = -455  # Adjusted for better jumping

func _physics_process(delta):
	# ✅ Apply gravity when not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta  # Multiply by delta for smooth physics
		#$Sprite2D.play("air")
		
	# ✅ Reset velocity.x before setting movement
	velocity.x = 0  
	
	# ✅ Handle left & right movement
	#var direction = Input.get_axis("left", "right")  # Returns -1, 0, or 1
	#velocity.x = direction * speed
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.play("idle")
		
	# ✅ Handle jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	# ✅ Apply movement with proper collision handling
	move_and_slide()

# Fall Zone 
func _on_fallzone_body_entered(body):
	get_tree().change_scene_to_file("res://level_1.tscn")
	
	
#extends CharacterBody2D
#
##var velocity = Vector2 (0,0)
##const SPEED = 180
##const GRAVITY = 35
##const JUMPFORCE = -800
#
#@export var speed: float = 180
#@export var gravity: float = 35
#@export var jump_force: float = -800
#
#func _physics_process(delta):
	#if Input.is_action_pressed("right"):
		#velocity.x = speed
	#if Input.is_action_pressed("left"):
		#velocity.x = -speed
	#
	#velocity.y = velocity.y + gravity
	#
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = jump_force
		#
	#move_and_slide()
	#
	#velocity.x = lerp(velocity.x,0.0,0.2)
