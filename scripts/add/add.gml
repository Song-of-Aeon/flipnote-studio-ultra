/// @desc adds two things.
/// @param {any} val1 first thing.
/// @param {any} val2 second thing.
/// @param {array} antiwhiletrue don't use this
/// @returns {any}

function add(val1, val2, antiwhiletrue=[]) {
	var args = [val1, val2];
	if array_find_index(global.gmtypes, typeof(val2)) < array_find_index(global.gmtypes, typeof(val1)) {
		val1 = args[0];
		val2 = args[1];
	}
	global.addoperations[$typeof(val1)][$typeof(val2)](val1, val2, antiwhiletrue);
}

global.addoperations = {
	number: {}
}
global.addoperations[$"number"][$"number"] = function(val1, val2) {
	return val1+val2;
}
global.addoperations[$"number"][$"string"] = function(val1, val2) {
	if val2 == real(val2) return val1+val2 else return string(val1) + val2;
}
global.addoperations[$"number"][$"bool"] = function(val1, val2) {
	return -itneg(val2)*val1;
}
global.addoperations[$"number"][$"int32"] = function(val1, val2) {
	return val1+val2;
}
global.addoperations[$"number"][$"int64"] = function(val1, val2) {
	return val1+val2;
}
global.addoperations[$"number"][$"ptr"] = function(val1, val2) {
	//return val1+val2;
}
global.addoperations[$"number"][$"undefined"] = function(val1, val2) {
	return NaN;
}
global.addoperations[$"number"][$"array"] = function(val1, val2) {
	array_push(val2, val1);
	return val2;
}
global.addoperations[$"number"][$"vec3"] = function(val1, val2) {
	val2.x += val1;
	val2.y += val1;
	val2.z += val1;
	return val2;
}
global.addoperations[$"number"][$"vec4"] = function(val1, val2) {
	val2.x += val1;
	val2.y += val1;
	val2.z += val1;
	val2.w += val1;
	return val2;
}
global.addoperations[$"number"][$"method"] = function(val1, val2) {
	//return val1+val2;
}
global.addoperations[$"number"][$"struct"] = function(val1, val2, antiwhiletrue=[]) {
	var dudes = variable_struct_get_names(val2);
	//var antiwhiletrue = [val2];
	iterate dudes to {
		if !array_contains(antiwhiletrue, val2[$dudes[i]]) {
			add(val2[$dudes[i]], val1);
			array_push(antiwhiletrue, val2[$dudes[i]]);
		}
	}
	return val2;
}
global.addoperations[$"number"][$"ref"] = function(val1, val2, antiwhiletrue=[]) {
	var dudes = variable_instance_get_names(val2);
	array_append(dudes, global.gameobjectvariables);
	//var antiwhiletrue = [val2];
	iterate dudes to {
		if !array_contains(antiwhiletrue, val2[$dudes[i]]) {
			add(val2[$dudes[i]], val1);
			array_push(antiwhiletrue, val2[$dudes[i]]);
		}
	}
	return val2;
}
global.addoperations[$"number"][$"null"] = function(val1, val2) {
	return val1;
}
global.addoperations[$"number"][$"unknown"] = function(val1, val2) {
	return add(make_value(), val1);
}