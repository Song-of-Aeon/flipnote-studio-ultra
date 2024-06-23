/// @description Insert description here
// You can write your code in this editor


event_inherited(); //super()

//x = mouse_x;
//y = mouse_y;
var i = array_length(linkList)-1;
repeat(array_length(linkList)-1) {
	if(!instance_exists(linkList[i])){
		array_resize(linkList,i);
		break;
	}
	linkList[i].friendly = friendly;
	linkList[i].damage = damage;
	//linkList[i].escapedistance = escapedistance;
	i--;
}