function screenwrap() {
	var _buffer = UNIT_SIZE;
	var _left_edge = view_xport[0];
	var _right_edge = view_xport[0] + camera_get_view_width(view_camera[0]);
	var _bottom_edge = view_yport[0] + camera_get_view_height(view_camera[0]);
	var _top_edge = view_yport[0];

	if (x >= _right_edge - _buffer) {
		x = _left_edge + _buffer;
		return true;
	}

	if (x < 0 + _buffer) {
		x = _right_edge - _buffer;
		return true;
	}
	
	if (y > _bottom_edge) {
		y = _top_edge;
		return true;
	}
	
	return false;
}