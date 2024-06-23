function string_remove(str, remove) {
	if typeof(remove) != "array" remove = [remove];
	read str out {
		if array_contains(remove, string_char_at(str, i)) {
			str = string_delete(str, i, 1);
			i--;
		}
	}
	return str;
}

