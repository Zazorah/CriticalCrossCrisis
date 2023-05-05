function camera_set_view_center(_cam, _center_x, _center_y, _clamp, _bounds) {
    var _view_width = camera_get_view_width(_cam);
    var _view_height = camera_get_view_height(_cam);
    var _corner_x, _corner_y;
    
    if(_clamp) {
        _center_x = clamp(_center_x, _view_width/2, room_width - _view_width/2);
        _center_y = clamp(_center_y, _view_height/2, room_height - view_height/2);
        
        // Handle when the view is larger than the room
        _center_x = view_width > room_width ? room_width/2 : _center_x;
        _center_y = view_height > room_height ? room_height/2 : _center_y;
    }
    
    _corner_x = _center_x - _view_width/2;
    _corner_y = _center_y - _view_height/2;
    
    if (_bounds[0] != -1) {
        _corner_x = clamp(_corner_x, _bounds[0], _bounds[2] - _view_width);
        _corner_y = clamp(_corner_y, _bounds[1], _bounds[3] - _view_height);
    }
    
    camera_set_view_pos(_cam, _corner_x, _corner_y);
}