class_name InventorySlot
extends PanelContainer

@export var type: ItemData.Type
var check_inventory: Signal

func init(t: ItemData.Type, cms: Vector2, s: Signal) -> void:
	type = t
	custom_minimum_size = cms
	check_inventory = s

func _can_drop_data(at_position, data):
	if data is InventoryItem:
		if type == ItemData.Type.MAIN:
			if get_child_count() == 0:
				return true
			else:
				if type == data.get_parent().type:
					return true
			return get_child(0).data.type == data.data.type
		else:
			if data.data:
				return data.data.type == type
			else:
				return false
		return false
	
func _drop_data(at_position, data):
	if get_child_count() > 0:
		var item := get_child(0)
		if item == data:
			return
		item.reparent(data.get_parent())
	data.reparent(self)
	# Emit a signal here to recalculate inventory
	self.check_inventory.emit()
