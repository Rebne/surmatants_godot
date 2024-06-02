extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar = $HealthBar

const SPEED = 900
const MAX_HEALTH = 3
const JUMP_VELOCITY = -2700

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var num = 12
var health: int = 0


func take_damage() -> void:
	health += 1
	health_bar.value = health
	
func _physics_process(delta):
	# Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta * num

	# Handle jump.
	if Input.is_action_just_pressed("jump_p2") and (is_on_floor() or is_on_wall()):
		velocity.y = JUMP_VELOCITY
		take_damage()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left_p2", "move_right_p2")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
