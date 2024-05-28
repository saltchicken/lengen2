extends CanvasLayer

signal check_inventory

var InvSize = 16
var itemsLoad = [
	"res://Item(Resource)/Sword.tres",
	"res://Item(Resource)/Bow.tres"
]

func _ready():
	self.visible = false
	for i in InvSize:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(32, 32), check_inventory)
		%Inventory.add_child(slot)
		
	for i in itemsLoad.size():
		var item := InventoryItem.new()
		item.init(load(itemsLoad[i]))
		%Inventory.get_child(i).add_child(item)
		item.add_to_group('items')
		
	#for i in InvSize:
		#var item := InventoryItem.new()
		#if i == 1:
			#item.init(load(itemsLoad[i]))
		#else:
			#item.init(load("res://Item(Resource)/Empty.tres"))
		#%Inventory.get_child(i).add_child(item)
		
	#get_inventory()
	check_inventory.connect(get_inventory)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('inventory'):
		self.visible = !self.visible
		
func get_inventory():
	print('TODO: Implement checking inventory')
	#var slotsCheck = %Inventory.get_children()
	#for slots in slotsCheck:
		#var item = slots.get_child(0)
		#if item:
			#print(item.data.name)


