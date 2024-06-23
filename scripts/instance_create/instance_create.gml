///@function instance_create(x, y, object, [layer, depth]);
function instance_create(x, y, object, layer_="instances", depth_) { //im sure you already got one o these
	var chump = instance_create_layer(x, y, layer_, object);
	if(depth_ != undefined){
		chump.depth = depth_;
	}
	return chump;
}

