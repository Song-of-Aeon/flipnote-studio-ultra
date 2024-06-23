function surface_secure(surf) {
	if !surface_exists(surf) {
		surf = surface_create(surface_get_width(surf), surface_get_height(surf));
	}
	return surf;
}