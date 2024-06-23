throwaway = surface_create(WIDTH, HEIGHT);
staginglayer = surface_create(WIDTH, HEIGHT);
displaylayer = surface_create(WIDTH, HEIGHT);
layers = [new artlayer(WIDTH, HEIGHT)];
uis = [new basictoolpick(), new brushpick(), new colorpick()];
activelayer = 0;

prevmouse = new vec2(mouse_x, mouse_y);

erasing = false;

tools = [new brush(), new eraser()];
toolpos = 0;
currenttool = tools[toolpos];

global.color = c_black;
uiactive = true;