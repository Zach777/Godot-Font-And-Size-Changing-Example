extends Control

var res : DynamicFont = load("Font.tres")

func _ready():
# warning-ignore:return_value_discarded
	$HBox/ChangeFont.connect("pressed", self, "pressed")
	# warning-ignore:return_value_discarded
	$HBox/SizeUp.connect("pressed", self, "sized_up")
	# warning-ignore:return_value_discarded
	$HBox/SizeDown.connect("pressed", self, "sized_down")

#Change font
func pressed() -> void :
	#If already the new font, revert to old.
	if res.font_data.font_path == "res://Silver.ttf" :
		var dyna : DynamicFontData = DynamicFontData.new()
		dyna.font_path = "res://Atkinson-Hyperlegible-Regular-102.otf"
		res.font_data = dyna
	else :
		var dyna : DynamicFontData = DynamicFontData.new()
		dyna.font_path = "res://Silver.ttf"
		res.font_data = dyna
	
	res.update_changes()

func sized_up() -> void :
	res.size += 1
	res.update_changes()

func sized_down() -> void :
	res.size -= 1
	res.update_changes()
