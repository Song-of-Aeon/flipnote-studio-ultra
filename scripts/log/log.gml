///@function log(data[...]);
function log() { //show_debug_message is for barbarians!
	var r = string(argument[0]), i;
	for (i=1; i<argument_count; i++) {
		r += ", " + string(argument[i]);
	}
	var stack = debug_get_callstack(10);
	show_debug_message(string(current_time) + " : " + string(stack[1]) + " : " + r);
	var val = (array_length(stack)+1)*25;
	var hue = 0;
	return r;
}