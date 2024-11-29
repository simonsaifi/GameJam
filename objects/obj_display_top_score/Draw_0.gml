if (room == RoomMenu) {
	draw_text_color(1052, 42,"High Score " + string(round(global.high_score)),c_white,c_white,c_white,c_white, 1);
	draw_text_color(1050, 40,"High Score " + string(round(global.high_score)),c_blue,c_blue,c_black,c_black,1);
}

else if (room == RoomGameover) {
	draw_text_color(952, 22,"High Score " + string(round(global.high_score)),c_white,c_white,c_white,c_white, 1);
	draw_text_color(950, 20,"High Score " + string(round(global.high_score)),c_red,c_red,c_black,c_black,1);
}