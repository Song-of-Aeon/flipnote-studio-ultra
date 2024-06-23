function tool(name_, value_) constructor {
	onhit = c_null;
	onhold = c_null;
	ondrop = c_null;
	step = c_null;
	draw = c_null;
	onrender = c_null;
	onderender = c_null;
	count = 0;
	iterations = 0;
	value = value_;
	name = name_;
}





global.tools = {
	//brush_
};

/*

value is from 1-10
but brush is 20

*/