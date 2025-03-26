class_name Hitbox extends Area2D

signal hit(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func take_damage(damage: int)->void:
	print(str(damage) + ' Ouch!')
	hit.emit(damage)
