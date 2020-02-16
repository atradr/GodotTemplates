extends Node
class_name StateMachine

var debug = false
var STATES = {}
var current_state = null
var next_state = null
var parent = null


func _init(parent, states_parent_node, initial_state, debug = false):
	self.parent = parent
	self.debug = debug
	_set_states_parent_node(states_parent_node)
	next_state = initial_state
	pass

func _set_states_parent_node(pnode):
	if debug: print("Found ", pnode.get_child_count(), " states")
	if pnode.get_child_count() == 0:
		return
	var state_nodes = pnode.get_children()
	for state_node in state_nodes:
		if debug: print("adding state: ", state_node.name)
		state_node._set_parent(parent, self)
		STATES[ state_node.name ] = state_node

func run(delta):
	if next_state != current_state:
		if current_state != null:
			if debug:
				print(parent.name, ": changing from state ", current_state.name, " to ", next_state.name)
			current_state.terminate()
		elif debug:
			print(parent.name, ": starting with state ", next_state.name)
		current_state = next_state
		current_state.initialize()
	# run state
	current_state.run(delta)
