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

class DialogflowContext {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.lifespan_count = null;
      this.parameters = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('lifespan_count')) {
        this.lifespan_count = initObj.lifespan_count
      }
      else {
        this.lifespan_count = 0;
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
    // Serializes a message object of type DialogflowContext
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [lifespan_count]
    bufferOffset = _serializer.int32(obj.lifespan_count, buffer, bufferOffset);
    // Serialize message field [parameters]
    // Serialize the length for message field [parameters]
    bufferOffset = _serializer.uint32(obj.parameters.length, buffer, bufferOffset);
    obj.parameters.forEach((val) => {
      bufferOffset = DialogflowParameter.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowContext
    let len;
    let data = new DialogflowContext(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lifespan_count]
    data.lifespan_count = _deserializer.int32(buffer, bufferOffset);
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
    length += _getByteLength(object.name);
    object.parameters.forEach((val) => {
      length += DialogflowParameter.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dialogflow_ros_msgs/DialogflowContext';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5a084e004a74b028dbad6a7fb9f08023';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    int32 lifespan_count
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
    const resolved = new DialogflowContext(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.lifespan_count !== undefined) {
      resolved.lifespan_count = msg.lifespan_count;
    }
    else {
      resolved.lifespan_count = 0
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

module.exports = DialogflowContext;
