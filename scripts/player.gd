extends CharacterBody2D

const DEFAULT_DIRECTION := "down"
const DEFAULT_ACTION := "idle"

var direction := DEFAULT_DIRECTION
var action := DEFAULT_ACTION


const SPEED := 75.0

func get_directedaction()->String:
	return action + "_" + direction
	
func animate()->void:
	if action == "attack":
		get_hitbox().disabled = false
	
	$AnimatedSprite2D.animation = get_directedaction()
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	
	action = DEFAULT_ACTION
	
func reset_hitboxes():
	$Hurtbox/HitUp.disabled = true
	$Hurtbox/HitDown.disabled = true
	$Hurtbox/HitLeft.disabled = true
	$Hurtbox/HitRight.disabled =true

func get_hitbox()->CollisionShape2D:
	if direction == "down":
		return $Hurtbox/HitDown
	elif direction == "up":
		return $Hurtbox/HitUp
	elif direction == "left":
		return $Hurtbox/HitLeft
	else:
		return $Hurtbox/HitRight

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	reset_hitboxes()
	
	if Input.is_action_pressed("attack"):
		action = "attack"
		
	elif Input.is_action_pressed("move_down"):
		action = "run"
		direction = "down"
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		action = "run"
		direction = "up"
		velocity.y -= 1
	elif Input.is_action_pressed("move_left"):
		action = "run"
		direction = "left"
		velocity.x -= 1
	elif Input.is_action_pressed("move_right"):
		action = "run"
		direction = "right"
		velocity.x += 1
	
		
	velocity = velocity.normalized() * SPEED
	position += velocity * delta
		
	animate()
	
	move_and_slide()
