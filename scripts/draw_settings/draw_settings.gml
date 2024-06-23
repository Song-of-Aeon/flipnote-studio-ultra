/// @desc Function Description
/// @param {real} fontstyle style of font to use. e.g: ft_chungus
/// @param {constant.color} [color]=c_black Description
/// @param {constant.halign} [halign]=fa_left Description
/// @param {constant.valign} [valign]=fa_top Description
function draw_settings(fontstyle, color=c_white, halign=fa_left, valign=fa_top) {
	set_font_style(fontstyle);
	draw_set_color(color);
	draw_set_halign(halign);
	draw_set_valign(valign);
}