extends StaticBody2D
class_name Chest
var chest_open = false

#func _ready():
	#print(Chest)
	#add_to_group('chests')
	
func use():
	if chest_open:
		close_chest()
	else:
		open_chest()

func open_chest():
	chest_open = true
	self.get_node('AnimatedSprite2D').play('open')
		
func close_chest():
	chest_open = false
	self.get_node('AnimatedSprite2D').play('close')
