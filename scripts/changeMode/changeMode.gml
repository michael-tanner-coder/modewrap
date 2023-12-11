function change_mode(){
	switch(mode)
	{
		case "big":
			sprite_index = spr_big_player;
			break;
		case "small":
			sprite_index = spr_short_player;
			break;
		case "tall":
			sprite_index = spr_tall_player;
			break;
		case "normal":
			sprite_index = spr_player;
			break;
		default:
			sprite_index = spr_player;
	}
}