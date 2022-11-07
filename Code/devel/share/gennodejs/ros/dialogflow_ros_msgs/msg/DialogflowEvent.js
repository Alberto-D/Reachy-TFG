// Auto-generated. Do not edit!

// (in-package dialogflow_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DialogflowParameter = require('./DialogflowParameter.js');

//-----------------------------------------------------------

class DialogflowEvent {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.event_name = null;
      this.parameters = null;
    }
    else {
      if (initObj.hasOwnProperty('event_name')) {
        this.event_name = initObj.event_name
      }
      else {
        this.event_name = '';
      }
      if (initObj.hasOwnProperty('parameters')) {
        this.parameters = initObj.parameters
      }
      else {
        this.parameters = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowEvent
    // Serialize message field [event_name]
    bufferOffset = _serializer.string(obj.event_name, buffer, bufferOffset);
    // Serialize message field [parameters]
    // Serialize the length for message field [parameters]
    bufferOffset = _serializer.uint32(obj.parameters.length, buffer, bufferOffset);
    obj.parameters.forEach((val) => {
      bufferOffset = DialogflowParameter.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowEvent
    let len;
    let data = new DialogflowEvent(null);
    // Deserialize message field [event_name]
    data.event_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [parameters]
    // Deserialize array length for message field [parameters]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parameters = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parameters[i] = DialogflowParameter.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.event_name);
    object.parameters.forEach((val) => {
      length += DialogflowParameter.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dialogflow_ros_msgs/DialogflowEvent';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86c638660c5df1b57b9ebd900d18906f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string event_name
    DialogflowParameter[] parameters
    ================================================================================
    MSG: dialogflow_ros_msgs/DialogflowParameter
    string param_name
    string[] value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DialogflowEvent(null);
    if (msg.event_name !== undefined) {
      resolved.event_name = msg.event_name;
    }
    else {
      resolved.event_name = ''
    }

    if (msg.parameters !== undefined) {
      resolved.parameters = new Array(msg.parameters.length);
      for (let i = 0; i < resolved.parameters.length; ++i) {
        resolved.parameters[i] = DialogflowParameter.Resolve(msg.parameters[i]);
      }
    }
    else {
      resolved.parameters = []
    }

    return resolved;
    }
};

module.exports = DialogflowEvent;
