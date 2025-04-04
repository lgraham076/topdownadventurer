class_name Hitbox extends Area2D

@export var hp :int = 1

signal hit(damage: int)
signal death()


func _ready() -> void:
	pass


func take_damage(damage: int)->void:
	hp -= damage

	if hp <= 0:
		death.emit()
	else:
		hit.emit(damage)
