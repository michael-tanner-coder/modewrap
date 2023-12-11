function screenwrap(){
	var _buffer = 64;
	if (x >= 320 - _buffer) {
		x = 0 + _buffer;
		return true;
	}

	if (x < 0 + _buffer) {
		x = 320 - _buffer;
		return true;
	}

	if (y > 240) {
		y = 0;
		return true;
	}
	
	if (y < 0) {
		y = 240;
		return true;
	}
	
	return false;
}