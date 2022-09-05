@tool
extends HBoxContainer

@onready var button = $Button 
@onready var http_Request = $HTTPRequest 
 
func set_to_valid():
	button.icon = ResourceLoader.load("res://addons/version-check/icons/valid.svg")
	button.text = ""

func set_to_invalid():
	button.icon = ResourceLoader.load("res://addons/version-check/icons/invalid.svg")
	button.text = ""

func set_to_loading():
	button.icon = ResourceLoader.load("res://addons/version-check/icons/loading.svg")
	button.text = ""

func _on_button_pressed():
	set_to_loading()
	$HTTPRequest.request("https://downloads.tuxfamily.org/godotengine/4.0/")

func _on_http_request_request_completed(result, response_code, headers, body:PackedByteArray):
	var parser: XMLParser = XMLParser.new()
	parser.open_buffer(body)
	var versions = []
	var version_numbers = []
	var current_element = ""
	while parser.read() == OK:
		match parser.get_node_type():
			XMLParser.NODE_ELEMENT:
				current_element = parser.get_node_name()
			XMLParser.NODE_TEXT:
				if current_element == "a" and not parser.get_node_data() == "/":
					versions.append(parser.get_node_data())
					#version_numbers.append(parser.get_node_data().replace("alpha", ""))
					#printt(current_element, parser.get_node_data())
	versions = strip_first_and_last(versions)
	#version_numbers = strip_first_and_last(version_numbers)
#	print(version_numbers)	

	if versions.has(Engine.get_version_info().status):
		set_to_valid()
	else:
		set_to_invalid()
		
func strip_first_and_last(list):
	var new_list = list
	new_list.remove_at(0)
	new_list.remove_at(len(new_list)-1)
	return new_list
	
	
