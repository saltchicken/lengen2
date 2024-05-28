extends State

@onready var character_body = self.get_owner()
@export var sprite : AnimatedSprite2D

var SPEED = 50.0

func Enter():
	character_body._walk()	
	
func Exit():
	pass
	
func Update(_delta:float):
	if character_body.movement:
		if character_body.run:
			state_transition.emit(self, 'run')
		else:
			character_body.velocity.x = character_body.movement.x * SPEED
			character_body.velocity.y = character_body.movement.y * SPEED
	else:
		state_transition.emit(self, 'idle')
	if character_body.use:
		character_body._use_objects()
