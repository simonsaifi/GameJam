if (room == RoomMenu) {
	draw_text_color(1052, 42,"Top Score " + string(round(global.high_score)),c_white,c_white,c_white,c_white, 1);
	draw_text_color(1050, 40,"Top Score " + string(round(global.high_score)),c_blue,c_blue,c_black,c_black,1);
}

else if (room == RoomGameover) {
	draw_text_color(972, 22,"Top Score " + string(round(global.high_score)),c_white,c_white,c_white,c_white, 1);
	draw_text_color(970, 20,"Top Score " + string(round(global.high_score)),c_red,c_red,c_black,c_black,1);
	
	draw_text_color(52, 22,"Score " + string(round(global.score*0.1)),c_white,c_white,c_white,c_white, 1);
	draw_text_color(50, 20,"Score " + string(round(global.score*0.1)),c_red,c_red,c_black,c_black,1);
}