function struct_to_array(struct) {
	var dudes = variable_struct_get_names(struct);
	var array = [];
	iterate dudes to {
		array[i] = struct[$dudes[i]];
	}
	return array;
}