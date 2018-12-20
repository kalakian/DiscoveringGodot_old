extends ItemList

func update_disguises(number):
	clear()
	for disguises in range(number):
		add_icon_item(load(Global.BOX_ICON), false)