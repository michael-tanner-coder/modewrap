/// @description Pubsub Manager

/*
struct = {
    "event name" = [
        [id, func],
        ...,
        [id, func]
    ],
    ...,
    "event name" = [
        [id, func],
        ...,
        [id, func]
    ],
}
*/

enum ps_event {
    inst_id = 0,
    inst_func = 1,
}

event_struct = {};

/**
 * @description Subscribe the given instance to the given event in the pubsub_manager
 * and optionally include a callback function
 * @param {real} _id
 * @param {string} _event
 * @param {Function} _func
 * @returns {null}
 */
subscribe = function(_id, _event, _func) {
    if (is_undefined(event_struct[$ _event])) {
        event_struct[$ _event] = [];
    } else if (is_subscribed(_id, _event) != -1) {
        return;
    }
    array_push(event_struct[$ _event], [_id, _func]);
}

/**
 * @description Publish the given event in the pubsub_manager and invoke all subscriber callbacks
 * @param {string} _event
 * @param {any} _data
 */
publish = function(_event, _data) {
    var _subscriber_array = event_struct[$ _event];
    
    if (is_undefined(_subscriber_array)) {
        return;
    }

    for (var i = array_length(_subscriber_array) - 1; i >= 0; i--) {
        if (instance_exists(_subscriber_array[i][ps_event.inst_id])) {
            _subscriber_array[i][ps_event.inst_func](_data);
        }else {
            array_delete(_subscriber_array, i, 1);
        }
    }
}

/**
 * @description Checked if the given instance ID is listed as a subscriber to the given event.
 * 
 * Returns the index of the subscriber's record in the list of event subscribers.
 * 
 * Returns -1 if no subscription is found.
 * @param {number} _id
 * @param {string} _event
 * @returns {real}
 */
is_subscribed = function (_id, _event) {
    for(var i = 0; i < array_length(event_struct[$ _event]); i+=1) {
        if (event_struct[$ _event][i][ps_event.inst_id] == _id) {
            return i;
        }
    }
    return -1;
}

/** Removed the subscriber's ID record from the subscriber list for the given event
 * @param {number} _id
 * @param {string} _event
 */
unsubscribe = function (_id, _event) {
    if (is_undefined(event_struct[$ _event])) {
        return;
    }

    var _pos = is_subscribed(_id, _event);
    if (_pos != -1) {
        array_delete(event_struct[$ _event], _pos, 1);
    }
}

/**
 * @description Invokes the unsubscribe function for all events to which the given instance is subscribed
 * @param {real} _id
 */
unsubscribe_all = function (_id) {
    // GML method for looping through a struct
    var _keys_array = variable_struct_get_names(event_struct);
    for(var i = (array_length(_keys_array) - 1) - 1; i >= 0; i--) {
        unsubscribe(_keys_array[i], _id);
    }
}

/**
 * @description Remove the given event type from the event struct. 
 * 
 * This will also remove all subscriptions to this event.
 * @param {string} _event
 */
remove_event = function(_event) {
    if (variable_struct_exists(event_struct, _event)) {
        variable_struct_remove(event_struct, _event);
    }
}

/**
 * @description Remove all entries in the event struct and reset the struct to an empty object
 */
remove_all_events = function() {
    delete event_struct;
    event_struct = {};
}

/**
 * @description Removes all "dead" instance IDs from the event struct along with their subscriptions
 */
remove_dead_instance_ids = function() {
    var _keys_array = variable_struct_get_names(event_struct);
    for (var i = 0; i < array_length(_keys_array); i++) {
        var _keys_array_subs = event_struct[$ _keys_array[i]];
        for (var j = array_length(_keys_array_subs) - 1; j >= 0; j++) {
            if (!instance_exists(_keys_array_subs[j][0])) {
                array_delete(event_struct[$ _keys_array[i]], j, 1);
            }
        }
    }
}
