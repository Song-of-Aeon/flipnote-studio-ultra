function type_reference(val) {
	switch typeof(val) {
		case "number":
		case "string":
		case "bool":
		case "int32":
		case "int64":
		case "ptr":
		case "undefined":
			return false;
		
		case "array":
		case "vec3":
		case "vec4":
		case "method":
		case "struct":
		case "ref":
			return true;
		
		case "null":
		case "unknown":
			return NaN;
	}
}

function is_number(val) {
	var numbertypes = ["number", "int32", "int64"];
	return array_contains(numbertypes, typeof(val));
}