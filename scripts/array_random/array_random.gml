/// @desc Function Description
/// @param {array} array Description
/// @param {any} [randfunc]=(get_value(self, "seed") != undefined ? irandom : irandom) Description
/// @param {any*} [weights] Array of numbers, higher numbers are more weighted
function array_random(array, randfunc=irandom, weights = undefined) {
	if(weights == undefined)
		return array[randfunc(array_length(array)-1)];
	var sum = array_sum(weights);
	if(randfunc == irandom)
		randfunc = random;
	var randValue = randfunc(sum);
	var currentSum = 0; //add up each weight until youre bigger than the random value, then return the i.
	for(var i = 0; i < array_length(weights); i++){
		currentSum+= weights[i];
		if(currentSum > randValue)
			return array[i];
	}
	return undefined;
	
}
function struct_random(struct, randfunc=irandom) {
	var dude = variable_struct_get_names(struct)
	return struct[$array_random(dude, randfunc)];
}