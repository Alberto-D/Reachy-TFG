// Auto-generated. Do not edit!

// (in-package dialogflow_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DialogflowContext = require('./DialogflowContext.js');

//-----------------------------------------------------------

class DialogflowRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.query_text = null;
      this.contexts = null;
    }
    else {
      if (initObj.hasOwnProperty('query_text')) {
        this.query_text = initObj.query_text
      }
      else {
        this.query_text = '';
      }
      if (initObj.hasOwnProperty('contexts')) {
        this.contexts = initObj.contexts
      }
      else {
        this.contexts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowRequest
    // Serialize message field [query_text]
    bufferOffset = _serializer.string(obj.query_text, buffer, bufferOffset);
    // Serialize message field [contexts]
    // Serialize the length for message field [contexts]
    bufferOffset = _serializer.uint32(obj.contexts.length, buffer, bufferOffset);
    obj.contexts.forEach((val) => {
      bufferOffset = DialogflowContext.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowRequest
    let len;
    let data = new DialogflowRequest(null);
    // Deserialize message field [query_text]
    data.query_text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [contexts]
    // Deserialize array length for message field [contexts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.contexts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.contexts[i] = DialogflowContext.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.query_text);
    object.contexts.forEach((val) => {
      length += DialogflowContext.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dialogflow_ros_msgs/DialogflowRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e7c6d1e65dc67cfb4606c28582ad7bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string query_text
    DialogflowContext[] contexts
    ================================================================================
    MSG: dialogflow_ros_msgs/DialogflowContext
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
    const resolved = new DialogflowRequest(null);
    if (msg.query_text !== undefined) {
      resolved.query_text = msg.query_text;
    }
    else {
      resolved.query_text = ''
    }

    if (msg.contexts !== undefined) {
      resolved.contexts = new Array(msg.contexts.length);
      for (let i = 0; i < resolved.contexts.length; ++i) {
        resolved.contexts[i] = DialogflowContext.Resolve(msg.contexts[i]);
      }
    }
    else {
      resolved.contexts = []
    }

    return resolved;
    }
};

module.exports = DialogflowRequest;
