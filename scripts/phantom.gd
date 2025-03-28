class_name Enemy extends Node2D

func _ready():
	$Hitbox.hit.connect(take_damage)
	
func take_damage(_damage: int) -> void:
	$AnimatedSprite2D.play("hit_right")
