class_name Hurtbox extends Area2D

@export var damage := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(hit)
	
	
func hit(area: Area2D) -> void:
	if area is Hitbox:
		area.take_damage(damage)
