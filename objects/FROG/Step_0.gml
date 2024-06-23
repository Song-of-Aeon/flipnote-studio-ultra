c_input();
//if erase.hit uiactive = !uiactive;

if uiactive {
	iterate uis to {
		uis[i].step();
	}
}

//currenttool = tools[toolpos];