function sm_data(path) {
	var sm = file_text_open_read(path);
	var data = {};
	var myline, property, value, valuing, char;
	do {
		myline = file_text_readln(sm);
		property = "";
		value = "";
		valuing = false;
		read myline out {
			char = string_char_at(myline, i) 
			if char == ":" {
				valuing = true;
			} else if char == ";" {
				break;
			} else if char == "=" {
				value = "";
			} else if valuing {
				value += char;
			} else {
				property += char;
			}
		}
		//log(property + " is " + value);
		property = string_replace_all(property, "#", "");
		value = string_replace_all(value, "\n", "");
		value = string_replace_all(value, "\r", "");
		if data == "" || property == "" continue;
		try {
			data[$property] = real(value);
		} catch(e) {
			data[$property] = value;
		}
	} until string_contains(myline, "NOTES");
	file_text_close(sm);
	return data;
}