class_name Enemy extends CharacterBody2D

@export var sprite : AnimatedSprite2D

const DEFAULT_DIRECTION := "right"
const DEFAULT_ACTION := "idle"

var direction := DEFAULT_DIRECTION
var action := DEFAULT_ACTION

func get_directedaction()->String:
	return action + "_" + direction

func _ready():
	$Hitbox.hit.connect(take_damage)
	$Hitbox.death.connect(death)

func animate()->void:
	sprite.animation = get_directedaction()
	sprite.play()
	await sprite.animation_finished
	
	if action == "death":
		queue_free()

	action = DEFAULT_ACTION

func _physics_process(_delta: float) -> void:
	position += velocity

	if action not in ["hit", "death"]:
		if velocity == Vector2.ZERO:
			action = DEFAULT_ACTION
		else:
			action = "run"
			if velocity.x < 0:
				direction = "left"
			else:
				direction = "right"
	else:
		velocity = Vector2.ZERO


	animate()
	move_and_slide()
	
func take_damage(_damage: int) -> void:
	action = "hit"

func death() -> void:
	action = "death"
