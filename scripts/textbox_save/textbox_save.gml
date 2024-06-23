function textbox_save(filename="save.aeon", textbox=self) {
	if textbox.object_index != o_textbox exit;
	var file = file_text_open_write(filename);
	
	file_text_write_string(file, script_get_name(textbox.msgscript));
	file_text_writeln(file);
	file_text_write_string(file, textbox.talkpos);
	
	
	file_text_close(file);
}

function textbox_load(filename="save.aeon") {
	if !file_exists(filename) {
		return false;
	}
	instance_destroy(o_textbox);
	var file = file_text_open_read(filename);
	
	var textscript = file_text_readln(file);
	var line = file_text_readln(file);
	textscript = string_remove(textscript, "\n");
	textscript = string_remove(textscript, "\r");
	textscript = string_remove(textscript, "\c");
	log(textscript);
	textscript = asset_get_index(textscript);
	log(textscript);
	
	var chump = textbox_create(textscript);
	while chump.talkpos < line {
		with chump textline_next();
	}
	
	file_text_close(file);
	return true;
}