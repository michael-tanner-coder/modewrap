function screenwrap() {
	var _buffer = UNIT_SIZE;
	var _left_edge = view_xport[1];
	var _right_edge = view_xport[1] + camera_get_view_width(view_camera[1]);
	var _bottom_edge = view_yport[1] + camera_get_view_height(view_camera[1]);
	var _top_edge = view_yport[1];

	if (x >= _right_edge) {
		x = _left_edge + _buffer/2;
		return true;
	}

	if (x < _left_edge) {
		x = _right_edge - _buffer/2;
		return true;
	}
	
	if (y > _bottom_edge) {
		y = _top_edge;
		return true;
	}
	
	return false;
}