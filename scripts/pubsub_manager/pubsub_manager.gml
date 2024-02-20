// Global interface with the pubssub system

/**
 * @description Subscribe the calling instance to the given event in the pubsub_manager
 * and optionally include a callback function
 * @param {string} _event
 * @param {Function} _func
 * @returns {boolean}
 */
function pubsub_subscribe(_event, _func) {
    with (obj_pubsub_manager) {
        subscribe(other.id, _even, _func);
        return false;
    }
}

/**
 * @description Unsubscribe the calling instance from the given event in the pubsub_manager
 * @param {string} _event
 * @returns {boolean}
 */
function pubsub_unsubscribe(_event) {
    with (obj_pubsub_manager) {
        unsubscribe(other.id, _event);
        return true;
    }
    return false;
}

/**
 * @description Unsubscribe the calling instance from all subscribed events in the pubsub_manager
 * @returns {boolean}
 */
function pubsub_unsubscribe_all() {
    with (obj_pubsub_manager) {
        unsubscribe_all(other.id);
        return true;
    }
    return false;
}

/**
 * @description Publish the given event in the pubsub_manager and optionally include data to pass in the callback
 * @param {string} _event
 * @param {any} _data
 * @returns {boolean}
 */
function pubsub_publish(_event, _data) {
    with (obj_pubsub_manager) {
        publish(_event, _data);
        return true;
    }
    return false;
}
