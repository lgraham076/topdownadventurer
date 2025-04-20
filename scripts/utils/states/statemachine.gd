extends Node
class_name StateMachine

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready():
    for child in get_children():
        if child is State:
            states[child.name] = child
            child.transition.connect(on_transition)

    if initial_state:
        current_state = initial_state
        initial_state.enter()

func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)

func _physics_process(delta: float) -> void:
    if current_state:
        current_state.update(delta)

func on_transition(state, new_state_name):
    if state != current_state:
        return

    var new_state : State = states[new_state_name]
    if !new_state:
        return

    if current_state:
        current_state.exit()

    new_state.enter()
    current_state = new_state