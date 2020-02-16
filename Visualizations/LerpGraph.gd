extends Node2D

# Could write about how I had this movement calculation that I randomly
# threw together and did not understand, so I created this visualization
# in order to gain a functional understanding of it.
# Also very interesting to see a graphical representation of the value that 
# I "felt" was right.
# And make the viz look all nice and shiz

var last_y = 0
var y = 0

onready var line : Line2D = $Line2D

func _ready():
	var width = get_viewport_rect().size.x - 100
	# 60 iterations ~~ 60 frames which would be what 1 second of movement looks like
	var num_iterations = 60
	for i in range(num_iterations):
		y = 1
		y = lerp(last_y, y, .15)
		last_y = y
		line.add_point(Vector2(50 + (width / num_iterations) * i, y * 500))
