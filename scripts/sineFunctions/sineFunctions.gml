function sine_wave(_time, _period, _amplitude, _midpoint) {
    return sin(_time * 2 * pi / _period) * _amplitude + _midpoint;
}