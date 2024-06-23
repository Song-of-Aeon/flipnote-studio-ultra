global.brushstyles = {};
function brushstyle(name_, sprite_, draw_=brushdraw, start_=c_null, release_=c_null, directional_=false) constructor {
	name = name_;
	sprite = sprite_;
	draw = munction(draw_);
	start = munction(start_);
	release = munction(release_);
	directional = directional_;
	global.brushstyles[$name] = self;
}

nu brushstyle("dot", s_2by2);
nu brushstyle("smallcircle", s_bulmicro);
nu brushstyle("mediumcircle", s_bulcircle);
nu brushstyle("bigcircle", s_bulbig);
nu brushstyle("weird", s_bulbigcc);
nu brushstyle("bullet", s_bullet);
nu brushstyle("vertical", s_bulthin);
nu brushstyle("spine", s_edge, function(x, y, x2, y2) {
	draw_between(x, y, x2, y2, sprite, 0, u, u, u, global.color);
	draw_between(x, y, x2, y2, sprite, 1, u, u, u, c_white);
});
nu brushstyle("edge", s_edge, function(x, y, x2, y2) {
	draw_between(x, y, x2, y2, sprite, 2, u, u, FROG.currenttool.dir, global.color);
	draw_between(x, y, x2, y2, sprite, 1, u, u, FROG.currenttool.dir, c_white);
}, function(x, y) {
	log("hi");
	draw_spr(x, y, s_edge, 0, u, u, u, global.color);
});

function brushdraw(x, y, x2, y2) {
	//gpu_set_blendmode(bm_add);
	draw_between(x, y, x2, y2, sprite, u, u, u, FROG.currenttool.dir*directional, global.color);
	//gpu_set_blendmode(bm_normal);
}

global.currentbrush = global.brushstyles.dot;