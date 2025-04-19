extends State
class_name Wander

@export var enemy: CharacterBody2D
@export var move_speed := 0.25

var move_direction : Vector2
var wander_time : float

func randomize_wander():
    if move_direction == Vector2.ZERO:
        move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
    else:
        move_direction = Vector2.ZERO
        
    wander_time = randf_range(1,5)

func enter():
    randomize_wander()

func exit():
    pass

func update(delta : float):
    if wander_time > 0:
        wander_time -= delta
    else:
        randomize_wander()
        if enemy:
            enemy.velocity = move_direction * move_speed


func physics_update(_delta : float):
    print("Uodating psychics")
    if enemy:
        enemy.velocity = move_direction * move_speed
