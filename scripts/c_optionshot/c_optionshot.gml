function optionshot(ncm_, who_, count_=u) {
	with ISAAC {
		var monkey = 0;
		var j;
		var shootable = false;
		for (j=0; j<array_length(myactive); j++) {
			monkey |= buttons[j].hold && (myactive[j].activetype == ACTIVES.SHOT || myactive[j] == c_getitembyid(ITEMS.NULL))
			if myactive[j].activetype == ACTIVES.SHOT shootable = true;
		}
		monkey &= ncm(ncm_, count_);
		if monkey && state == st_standard with who_ pulse++;
		return monkey;
	}
}
/*function optionshot(ncm_, who_) {
	with ISAAC {
		if ((shooth && (myactive[0].activetype = ACTIVES.SHOT || myactive[0] = c_getitembyid(ITEMS.NULL)))
		|| (bombh && (myactive[1].activetype = ACTIVES.SHOT || myactive[1] = c_getitembyid(ITEMS.NULL)))
		|| (specialh && (myactive[2].activetype = ACTIVES.SHOT || myactive[2] = c_getitembyid(ITEMS.NULL))))
		&& ncm(ncm_) && state == st_standard {
			with who_ {pulse++};
		}
	}
}*/