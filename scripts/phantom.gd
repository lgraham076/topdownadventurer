class_name Enemy extends Node2D

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
	$AnimatedSprite2D.animation = get_directedaction()
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	
	if action == "death":
		queue_free()

	action = DEFAULT_ACTION

func _physics_process(_delta: float) -> void:
	animate()
	
func take_damage(_damage: int) -> void:
	action = "hit"

func death() -> void:
	action = "death"
