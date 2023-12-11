function check_for_collision(_dt = 1)
{
	var _collided = false;
	var _bbox_width = bbox_right - bbox_left;
	var _bbox_height = bbox_bottom - bbox_top;
	
	while(
			(
				position_meeting(x, y + _bbox_height, Ground) || 
				position_meeting(x + _bbox_width/2, y + _bbox_height, Ground) || 
				position_meeting(x + _bbox_width, y + _bbox_height, Ground)
			) 
			&& grounded
		) 
		{
			y -= 0.1 * _dt;
			_collided = true;
		}
		
	return _collided;
}