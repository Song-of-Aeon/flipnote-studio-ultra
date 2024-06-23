function loptions() {
	var array = [];
	var i;
	for (i=0; i<parameter_count(); I++) {
		array_push(array, parameter_string(i));
	}
	return array;
}

function loptions_contains(option) {
	return array_contains(loptions(), option);
}
