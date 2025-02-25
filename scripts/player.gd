extends CharacterBody2D

const DEFAULT_DIRECTION := "down"
const DEFAULT_ACTION := "idle"

var direction := DEFAULT_DIRECTION
var action := DEFAULT_ACTION

func get_directedaction()->String:
	return action + "_" + direction
	
func animate()->void:
	$AnimatedSprite2D.animation = get_directedaction()
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	action = DEFAULT_ACTION
	return

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("move_down"):
		direction = "down"
	elif Input.is_action_just_pressed("move_up"):
		direction = "up"
	elif Input.is_action_just_pressed("move_left"):
		direction = "left"
	elif Input.is_action_just_pressed("move_right"):
		direction = "right"
		
	if Input.is_action_just_pressed("attack"):
		action = "attack"
		
	animate()
	
	move_and_slide()
