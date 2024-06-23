nu bullet("small", s_bulsmall);
nu bullet("point", s_bulpoint);
nu bullet("square", s_bulsquare);
nu bullet("circle", s_bulcircle);
nu bullet("bullet", s_bulbullet);
nu bullet("core", s_bulcore);
nu bullet("card", s_bulcard);
nu bullet("cross", s_bulcross);
nu bullet("thin", s_bulthin);
nu bullet("big", s_bulbig);
nu bullet("star", s_bulstar, u, u, u, u, function() {image_angle = global.count*2; bulletdraw()}, false); //potential desync!
nu bullet("seed", s_bulseed);
nu bullet("gem", s_bulgem);
nu bullet("kunai", s_bulkunai);
nu bullet("knife", s_bulknife);
nu bullet("fire", s_bulfire);
nu bullet("bubble", s_bulbubble);
nu bullet("micro", s_bulmicro);