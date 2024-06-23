function load_tevents(str, textbox, teventarray=tevents) {
	var i;
	var amount = 0;
	for (i=1; i<=string_length(str); i++) {
		if string_char_at(str, i) == "|" {
			amount++;
			theffect = global.texteffects[$string_char_at(str, i+1)];
			var args = string_copy(str, i+2, theffect.arglength);
			var friend = new tevent(i, method(textbox, theffect.event), theffect.textmod, args);
			friend.name = string_char_at(str, i+1);
			array_push(teventarray, friend);
			str = string_delete(str, i, theffect.arglength+2);
			i--;
		}
	}
	return str;
}