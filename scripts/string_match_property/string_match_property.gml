function string_match_property(str, structs, matchproperty, caseless=false) {
	var perfects = [];
	var matches = [];
	if caseless str = string_lower(str);
	if typeof(structs) == "struct" {
		structs = struct_to_array(structs);
	}
	iterate structs to {
		//log(i, matchproperty);
		if structs[i] == undefined continue;
		var name = get_value(structs[i], matchproperty);
		if name == undefined continue;
		if caseless name = string_lower(name);
		if string_contains(name, str) {
			if name == str {
				array_push(perfects, structs[i]);
				break;
			} else {
				array_push(matches, structs[i]);
			}
		}
	}
	return array_length(perfects) ? perfects : matches;
}