extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("move_down"):
		$AnimatedSprite2D.animation = "idle_down"
	elif Input.is_action_just_pressed("move_up"):
		$AnimatedSprite2D.animation = "idle_up"
	elif Input.is_action_just_pressed("move_left"):
		$AnimatedSprite2D.animation = "idle_left"
	elif Input.is_action_just_pressed("move_right"):
		$AnimatedSprite2D.animation = "idle_right"

	move_and_slide()
